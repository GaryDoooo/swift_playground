//
//  Scene.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit
import PlaygroundSupport

/// The Scene is the container for all nodes and graphics created.
///
/// - localizationKey: Scene
public class Scene: PlaygroundRemoteLiveViewProxyDelegate {
    
    let size = CGSize(width: 1024, height: 1024)
    
    private var isTouchHandlerRegistered: Bool = false
    
    static var messageScene:Scene? // hold on to the message scene so it doesn't deallocate
    
    static var axUIToneSensor:ToneSensor? {
        didSet {
            let proxy = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy
            
            if proxy?.delegate == nil {
                messageScene = Scene() // ensure a Scene exists to route tone sensor messages
            }
        }
    }
    static var axUILightSensor:LightSensor? {
        didSet {
            let proxy = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy
            
            if proxy?.delegate == nil {
                messageScene = Scene() // ensure a Scene exists to route tone sensor messages
            }
        }
    }
    
    var runLoopRunning = false {
        didSet {
            if runLoopRunning {
                CFRunLoopRun()
            }
            else {
                CFRunLoopStop(CFRunLoopGetMain())
            }
        }
    }
    
    /// A dictionary of the graphics that have been placed on the Scene, using each graphic’s id property as keys.
    ///
    /// - localizationKey: Scene.placedGraphics
    public var placedGraphics = [String: Graphic]()
    
    private var backingGraphics: [Graphic] = []
    
    /// The collection of graphics on the Scene.
    ///
    /// - localizationKey: Scene.graphics
    public var graphics: [Graphic] {
        get {
            Message.getGraphics.send()
            runLoopRunning = true
            defer {
                backingGraphics.removeAll()
            }
            return backingGraphics
        }
    }
    
    /// Returns the graphics on the Scene with the specified name.
    ///
    /// - Parameter name: A name you have given to a graphic or set of graphics.
    ///
    /// - localizationKey: Scene.getGraphics(named:)
    public func getGraphics(named name: String) ->  [Graphic] {
        return graphics.filter( { $0.name == name })
    }
    
    /// Returns the graphics on the Scene with a name containing the specified text.
    ///
    /// - Parameter text: The name you have given to a graphic or set of graphics.
    ///
    /// - localizationKey: Scene.getGraphicsWithName(containing:)
    public func getGraphicsWithName(containing text: String) -> [Graphic] {
        return graphics.filter( { $0.name.contains(text) })
    }
    
    /// Removes all of the graphics with a certain name from the Scene.
    ///
    /// - Parameter name: The name you have given to a graphic or set of graphics.
    ///
    /// - localizationKey: Scene.removeGraphics(named:)
    public func removeGraphics(named name: String) {
        for graphic in graphics.filter( { $0.name == name }) {
            graphic.remove()
        }
    }
    
    /// Removes all of the graphics on the Scene.
    ///
    /// - Parameter graphic: Type in the graphic you want to remove here.
    ///
    /// - localizationKey: Scene.remove(_:)
    public func remove(_ graphic: Graphic) {
        graphic.remove()
    }
    
    /// Gets all of the graphics in a certain area of the Scene.
    ///
    /// - Parameter point: The center point of the boundary you want to target.
    /// - Parameter bounds: The width and height of the area.
    ///
    /// - localizationKey: Scene.getGraphics(at:in:)
    public func getGraphics(at point: Point, in bounds: Size) -> [Graphic] {
        var graphicsInArea = [Graphic]()
        let bottomLeft = Point(x: point.x - bounds.width / 2, y: point.y - bounds.height / 2)
        let area = CGRect(origin: CGPoint(bottomLeft), size: CGSize(width: bounds.width, height: bounds.height))
        
        for graphic in graphics {
            if area.contains(CGPoint(graphic.position)) {
                graphicsInArea.append(graphic)
            }
        }
        return graphicsInArea
    }
    /// Creates a horizontal row of repeating images.
    ///
    /// - Parameter image: The image you want to use to create the floor.
    /// - Parameter n: How far across the scene you want the images to span.
    /// - Parameter position: The center position of the floor.
    ///
    /// - localizationKey: Scene.createFloor(_:n:position:)
    // TODO: Still used in page setup code for exploration, can't remove until API is switched out for createSurface
    public func createFloor(_ image: Image, width n: Int, atPoint position: Point) {
        createWall(image, height: n, atPoint: position, withRotation: 0, withName: "floor", isDynamic: false)
    }
    
    /// Creates a vertical column of repeating images.
    ///
    /// - Parameter image: The image you want to use to create a wall.
    /// - Parameter n: How far up or down you want the images to span.
    /// - Parameter position: The position on the *x* and *y* axis of the wall.
    /// - Parameter rotation: The angle of the wall; for example, `90` represents a vertical wall.
    /// - Parameter name: A name you give to the wall.
    /// - Parameter isDynamic: A Boolean value to indicate if the wall moves in response to the physics simulation. The default is `false`, which means the wall will not move.
    ///
    /// - localizationKey: Scene.createWall(_:n:position:rotation:name:isDynamic:)
    // TODO: Still used in page setup code for exploration, can't remove until API is switched out for createSurface
    public func createWall(_ image: Image, height n: Int, atPoint position: Point, withRotation rotation: Double = 90, withName name: String = "wall", isDynamic: Bool = false) {
        var startingPosition = position
        for _ in 0..<n {
            let ground = Sprite(image: image, name: name)
            ground.rotation = rotation
            ground.isDynamic = isDynamic
            let xDist = cos(rotation * Double.pi / 180) * Double(image.size.width)
            let yDist = sin(rotation * Double.pi / 180) * Double(image.size.height)
            self.place(ground, at: startingPosition)
            startingPosition.x += xDist
            startingPosition.y += yDist
        }
    }
    
    /// Creates a series of images in a line. You can specify the Point, dimensions, rotation, name, and whether the line is dynamic.
    ///
    /// - Parameter image: The image you want to use to create the surface.
    /// - Parameter point: Where the surface is in the scene.
    /// - Parameter size: The width and height of the surface.
    /// - Parameter rotation: The angle of rotation of the surface.
    /// - Parameter name: A name you give to the surface
    /// - Parameter isDynamic: A Boolean value to indicate if the surface will move in response to the physics simulation. The default is `false`: the surface will not move.
    ///
    /// - localizationKey: Scene.createSurface(_:point:size:rotation:name:isDynamic:)
    public func createSurface(_ image: Image, at point: Point, size: Size, withRotation rotation: Double = 0, named name: String = "surface", isDynamic: Bool = false) {
        var startingPosition = point
        for i in 1...Int(size.height) {
            for _ in 0..<Int(size.width) {
                let ground = Sprite(image: image, name: name)
                ground.rotation = rotation
                ground.isDynamic = isDynamic
                let xDist = cos(rotation * Double.pi / 180) * Double(image.size.width)
                let yDist = sin(rotation * Double.pi / 180) * Double(image.size.height)
                self.place(ground, at: startingPosition)
                startingPosition.x += xDist
                startingPosition.y += yDist
            }
            let yMov = point.y + (cos(rotation * Double.pi / 180) * Double(image.size.height)) * Double(i)
            let xMov = point.x + (-sin(rotation * Double.pi / 180) * Double(image.size.height)) * Double(i)
            startingPosition.y = yMov
            startingPosition.x = xMov
        }
    }
    
    private var lastPlacePosition: Point = Point(x: Double.greatestFiniteMagnitude, y: Double.greatestFiniteMagnitude)
    private var graphicsPlacedDuringCurrentInteraction = Set<Graphic>()
    
    /// Initialize a Scene.
    ///
    /// - localizationKey: Scene()
    public init() {
        //  The user process must remain alive to receive touch event messages from the live view process.
        let page = PlaygroundPage.current
        page.needsIndefiniteExecution = true
        let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy
        
        proxy?.delegate = self
        
        clear()
        
        Scene.messageScene = nil // release any scene automatically produced by Light and Tone sensors
    }
    
    public func remoteLiveViewProxyConnectionClosed(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy) {
        clearInteractionState()
    }
    
    public func remoteLiveViewProxy(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy, received message: PlaygroundValue) {
        guard let message = Message(rawValue: message) else { return }
        switch message {
        case .sceneTouchEvent(let touch):
            handleSceneTouchEvent(touch: touch)
            
        // Scene collision event.
        case .sceneCollisionEvent(let collision):
            handleSceneCollisionEvent(collision: collision)
        
        case .setAssessment(let status):
            PlaygroundPage.current.assessmentStatus = status
            
        case .trigger(let assessmentTrigger):
            handleAssessmentTrigger(assessmentTrigger)
            
        case .getGraphicsReply(let graphicsReply):
            backingGraphics = graphicsReply
            runLoopRunning = false
        
        case .updateGraphicAttributes(let positions, let sizes):
            for id in positions.keys {
                if let graphic = placedGraphics[id],
                   let position = positions[id] {
                    
                    graphic.suppressMessageSending = true
                    graphic.position = Point(position)
                    graphic.suppressMessageSending = false
                }
            }
            
            for id in sizes.keys {
                if let graphic = placedGraphics[id],
                   let size = sizes[id] {
                    
                    graphic.suppressMessageSending = true
                    graphic.size = Size(size)
                    graphic.suppressMessageSending = false
                }
            }
            
        case .removedGraphic(let id):
            placedGraphics.removeValue(forKey: id)
        
        case .setAXUIColor(let color):
            if let axUILightSensor = Scene.axUILightSensor {
                axUILightSensor.axUIColor = color
            }
            
        case .setAXUITone(let tone):
            if let axUIToneSensor = Scene.axUIToneSensor {
                axUIToneSensor.axUITone = tone
            }
            
        default:
            ()
        }
    }
    
    func handleSceneTouchEvent(touch: Touch) {
        var touch = touch
        
        touch.previousPlaceDistance = lastPlacePosition.distance(from: touch.position)

        if touch.firstTouch, let touchedGraphic = touch.touchedGraphic, let button = placedGraphics[touchedGraphic.id] as? Button {
            // First touch on a button => tap on a button.
            switch button.buttonType {
            case .green:
                Message.runAnimation(id: button.id, animation: "greenButton", duration: 0.1, numberOfTimes: 1).send()
            case .red:
                Message.runAnimation(id: button.id, animation: "redButton", duration: 0.1, numberOfTimes: 1).send()
            }
            button.onTapHandler?()
        } else if touch.firstTouch, let touchedGraphic = touch.touchedGraphic, let sprite = placedGraphics[touchedGraphic.id] as? Sprite {
            sprite.onTapHandler?()
        } else if touch.firstTouch, let touchedGraphic = touch.touchedGraphic, let label = placedGraphics[touchedGraphic.id] as? Label {
            label.onTapHandler?()
        } else if touch.firstTouch, let touchedGraphic = touch.touchedGraphic, let character = placedGraphics[touchedGraphic.id] as? Player {
            character.onTapHandler?()
        } else if touch.firstTouch, let touchedGraphic = touch.touchedGraphic, let graphic = placedGraphics[touchedGraphic.id] {
            graphic.onTapHandler?()
        } else {
            // Touch on the scene.
            if let touchedGraphic = touch.touchedGraphic {
                onGraphicTouchedHandler?(touchedGraphic)
            } else {
                onFingerMovedHandler?(touch)
            }
        }

        Message.touchEventAcknowledgement.send()
    }
    
    func handleSceneCollisionEvent(collision: Collision) {
        onCollisionHandler?(collision)
    }
    
    
    func clearInteractionState() {
        graphicsPlacedDuringCurrentInteraction.removeAll()
        lastPlacePosition = Point(x: Double.greatestFiniteMagnitude, y: Double.greatestFiniteMagnitude)
    }
    
    func handleAssessmentTrigger(_ assessmentTrigger: AssessmentTrigger) {
        guard assessmentController?.style == .continuous else { return }
        
        switch assessmentTrigger {
            
        case .start(let context):
            assessmentController?.removeAllAssessmentEvents()
            assessmentController?.allowAssessmentUpdates = true
            assessmentController?.context = context
            
        case .stop:
            assessmentController?.allowAssessmentUpdates = false
            clearInteractionState()
            
        case .evaluate:
            assessmentController?.setAssessmentStatus()
        }

    }
    
    
    /// The Scene's background image.
    ///
    /// - localizationKey: Scene.backgroundImage
    public var backgroundImage: Image? = nil {
        didSet {
            Message.setSceneBackgroundImage(backgroundImage).send()
            assessmentController?.append(.setSceneBackgroundImage(backgroundImage))
        }
    }
    
    /// The vertical gravity; the default is `-9.8`.
    ///
    /// - localizationKey: Scene.verticalGravity
    public var verticalGravity: Double = -9.8 {
        didSet {
            Message.setSceneGravity(vector: CGVector(dx: horizontalGravity, dy: verticalGravity)).send()
        }
    }
    
    /// The horizontal gravity; the default is `0`.
    ///
    /// - localizationKey: Scene.horizontalGravity
    public var horizontalGravity: Double = 0 {
        didSet {
            Message.setSceneGravity(vector: CGVector(dx: horizontalGravity, dy: verticalGravity)).send()
        }
    }
    
    /// Set to `true` to show a 50 x 50 pixel grid over the background. This can be helpful when deciding where to place things on the Scene.
    ///
    /// - localizationKey: Scene.isGridVisible
    public var isGridVisible: Bool = false {
        didSet {
            Message.setSceneGridVisible(isGridVisible).send()
        }
    }
    
    /// Set to `true` to have graphics bounce back into the Scene when they hit a border.
    ///
    /// - localizationKey: Scene.hasCollisionBorder
    public var hasCollisionBorder: Bool = true {
        didSet {
            Message.setBorderPhysics(hasCollisionBorder).send()
        }
    }
    
    /// The Scene's background color.
    ///
    /// - localizationKey: Scene.backgroundColor
    public var backgroundColor: Color  = .white {
        didSet {
            Message.setSceneBackgroundColor(backgroundColor).send()
        }
    }
    
    /// The function that’s called when you touch the Scene; this is the event handler for `touch` events.
    ///
    /// - localizationKey: Scene.touchHandler
    public var touchHandler: ((Touch)-> Void)? = nil {
        didSet {
            guard (touchHandler == nil && isTouchHandlerRegistered) || ( touchHandler != nil && !isTouchHandlerRegistered) else { return }
            Message.registerTouchHandler(touchHandler == nil).send()
        }
    }
    
    // MARK: Public Event Handlers
    
    /// The function that's called when your finger moves across the scene; this is the event handler for `finger moved` events.
    ///
    /// - localizationKey: Scene.onFingerMovedHandler
    public var onFingerMovedHandler: ((Touch) -> Void)?
    
    // Favoring setting an onTapped handler for individual graphics instead of this more generalized method - no longer exposing to learner.
    var onGraphicTouchedHandler: ((Graphic) -> Void)?
    
    /// The function that's called when two things collide onscreen; this is the event handler for `collision` events.
    ///
    /// - localizationKey: Scene.onCollisionHandler
    public var onCollisionHandler: ((Collision) -> Void)?
    
    /// Sets the function that's called when graphics collide in a Scene; this is the event handler for a `collision` event.
    ///
    /// - localizationKey: Scene.setOnCollisionHandler(_:)
    public func setOnCollisionHandler(_ handler: @escaping ((Collision) -> Void)) {
        onCollisionHandler = handler
    }
    
    /// Sets the function that’s called when your finger moves across the Scene; this is the event handler for a `finger moved` event.
    ///
    /// - Parameter handler: Write the function name here.
    ///
    /// - localizationKey: Scene.setOnFingerMovedHandler(_:)
    public func setOnFingerMovedHandler(_ handler: ((Touch) -> Void)?) {
        onFingerMovedHandler = handler
    }
    
    // Favoring setting an onTapped handler for individual graphics instead of this more generalized method - no longer exposing to learner.
    func setOnGraphicTouchedHandler(_ handler: ((Graphic) -> Void)?) {
        onGraphicTouchedHandler = handler
    }
    
    // MARK: Public Methods
    
    /// Removes all of the graphics from the Scene.
    ///
    /// - localizationKey: Scene.clear()
    public func clear() {
        placedGraphics.removeAll()
        Message.clearScene.send()
    }
    
    /// Creates a Sprite with an image and a name.
    ///
    /// - Parameter from: An image you choose to use as the Sprite.
    /// - Parameter named: A name you give the Sprite.
    ///
    /// - localizationKey: Scene.createSprites(from:named:)
    public func createSprites(from images: [Image], named: String) -> [Sprite] {
        var groupOfSprites = [Sprite]()
        
        for image in images {
            let sprite = Sprite(image: image, name: named)
            groupOfSprites.append(sprite)
        }
        return groupOfSprites
    }
    
    /// Places a graphic at a point on the Scene.
    ///
    /// - Parameter graphic: The graphic to be placed on the Scene.
    /// - Parameter at: The point at which the graphic is placed.
    /// - Parameter anchoredTo: The anchor point within the graphic from which the graphic is initially placed. Defaults to the center.
    ///
    /// - localizationKey: Scene.place(_:at:)
    public func place(_ graphic: Graphic, at: Point, anchoredTo: AnchorPoint = .center) {
        Message.placeGraphic(id: graphic.id, position: CGPoint(at), anchor: anchoredTo, isPrintable: false).send()
        assessmentController?.append(.placeAt(graphic: graphic, position: at))
        graphicsPlacedDuringCurrentInteraction.insert(graphic)
        placedGraphics[graphic.id] = graphic
        lastPlacePosition = at
        
        graphic.suppressMessageSending = true
        graphic.position = at
        graphic.suppressMessageSending = false
    }
    
    /// Returns an array of count points on a circle around the center point.
    ///
    /// - Parameter radius: The radius of the circle.
    /// - Parameter count: The number of points to return.
    ///
    /// - localizationKey: Scene.circlePoints(radius:count:)
    public func circlePoints(radius: Double, count: Int) -> [Point] {
        
        var points = [Point]()
        
        let slice = 2 * Double.pi / Double(count)
        
        let center = Point(x: 0, y: 0)
        
        for i in 0..<count {
            let angle = slice * Double(i)
            let x = center.x + (radius * cos(angle))
            let y = center.y + (radius * sin(angle))
            points.append(Point(x: x, y: y))
        }
        
        return points
    }
    
    /// Returns an array of count points in a square box around the center point.
    ///
    /// - Parameter width: The width of each side of the box.
    /// - Parameter count: The number of points to return.
    ///
    /// - localizationKey: Scene.squarePoints(width:count:)
    public func squarePoints(width: Double, count: Int) -> [Point] {
        
        var points = [Point]()
        
        guard count > 4 else { return points }
        
        let n = count / 4
        
        let sparePoints = count - (n * 4)
        
        let delta = width / Double(n)
        
        var point = Point(x: -width/2, y: -width/2)
        points.append(point)
        for _ in 0..<(n - 1) {
            point.y += delta
            points.append(point)
        }
        point = Point(x: -width/2, y: width/2)
        points.append(point)
        for _ in 0..<(n - 1) {
            point.x += delta
            points.append(point)
        }
        point = Point(x: width/2, y: width/2)
        points.append(point)
        for _ in 0..<(n - 1) {
            point.y -= delta
            points.append(point)
        }
        point = Point(x: width/2, y: -width/2)
        points.append(point)
        for _ in 0..<(n - 1) {
            point.x -= delta
            points.append(point)
        }
        
        // Duplicate remainder points at the end
        for _ in 0..<sparePoints {
            points.append(point)
        }
        
        return points
    }
    
    func rotatePoints(points: [Point], angle: Double) -> [Point] {
        
        var rotatedPoints = [Point]()
        
        let angleRadians = (angle / 360.0) * (2.0 * Double.pi)
        
        for point in points {
            let x = point.x * cos(angleRadians) - point.y * sin(angleRadians)
            let y = point.y * cos(angleRadians) + point.x * sin(angleRadians)
            rotatedPoints.append(Point(x: x, y: y))
        }
        return rotatedPoints
    }
    
    /// Returns an array of count points in a square grid of the given size, rotated by angle (in degrees).
    ///
    /// - Parameter size: The size of each side of the grid.
    /// - Parameter count: The number of points to return.
    /// - Parameter angle: The angle of rotation in degrees.
    ///
    /// - localizationKey: Scene.gridPoints(size:count:angle:)
    public func gridPoints(size: Double, count: Int, angle: Double = 0) -> [Point] {
        
        var points = [Point]()
        
        // Get closest value for n that fits an n * n grid inside count.
        let n = Int(floor(sqrt(Double(count))))
        
        if n <= 1 {
            return [Point(x: 0, y: 0)]
        }
        
        let surplusPoints = count - (n * n)
        
        let delta = size / Double(n - 1)
        
        let startX = -(size / 2.0)
        let startY = -(size / 2.0)
        
        var x = startX
        var y = startY
        
        for _ in 0..<n {
            for _ in 0..<n {
                points.append(Point(x: x, y: y))
                x += delta
            }
            y += delta
            x = startX
        }
        
        // Duplicate and overlay any surplus points after the n * n grid has been added.
        for i in 0..<surplusPoints {
            points.append(points[i])
        }
        
        if angle != 0 {
            points = rotatePoints(points: points, angle: angle)
        }
        
        return points
    }
    
    public func useOverlay(overlay: Overlay) {
        Message.useOverlay(overlay).send()
    }
}
