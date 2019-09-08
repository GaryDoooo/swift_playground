// 
//  Message.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import PlaygroundSupport


// MARK: Enum Types
public enum MessageKey: String {
    
    case messageType
    case path
    case id
    case graphicType
    case name
    case graphicName
    case animation
    case animationSequence
    case color
    case tone
    case registered
    case anchor
    case point
    case position
    case positions
    case sizes
    case vector
    case limit
    case icon
    case array
    case dictionary
    case hidden
    case visible
    case text
    case image
    case shape
    case xScale
    case yScale
    case velocity
    case volume
    case assessmentStatus
    case action
    case key
    case rotations
    case numberOfAnimations
    case duration
    case touch
    case collision
    case assessmentTrigger
    case fontName
    case fontSize
    case textColor
    case isPrintable
    case graphic
    case graphics
    case overlay
    case sound
    case instrument
    case note
    case gravity
    case isDynamic
    case allowsRotation
    case allowsBorderPhysics
    case columns
    case rows
    case accessibilityHints
}


public enum MessageName: String {
    case playSound
    case playMusic
    case playInstrument
    case setBorderPhysics
    case setSceneBackgroundColor
    case setSceneBackgroundImage
    case setSceneGridVisible
    case setLightSensorImage
    case clearScene
    case createNode
    case deleteNode
    case getNodes
    case getNodesReply
    case setImage
    case setShape
    case setTiledImage
    case setAffectedByGravity
    case setIsDynamic
    case setAllowsRotation
    case setSceneGravity
    case setVelocity
    case setXScale
    case setYScale
    case setText
    case setTextColor
    case registerTouchHandler
    case sceneTouchEvent
    case sceneCollisionEvent
    case requestRateLimit
    case replyRateLimit
    case spin
    case setAssessment
    case runAction
    case runAnimation
    case runCustomAnimation
    case applyImpulse
    case applyForce
    case trigger
    case placeGraphic
    case updateGraphicAttributes
    case removeGraphic
    case removedGraphic
    case setFontSize
    case setFontName
    case getGraphics
    case getGraphicsReply
    case touchEventAcknowledgement
    case overlay
    case axUITone
    case axUIColor
    case setAccessibilityHints
}

extension MessageKey {
    
    var transformable: PlaygroundValueTransformable.Type {
        switch self {
            
        case .assessmentTrigger:
            return AssessmentTrigger.self
            
        case .image:
            return Image.self
            
        case .shape:
            return BasicShape.self
            
        case .messageType:
            return MessageName.self
            
        case .path, .id, .text, .name, .key, .fontName, .graphicType, .graphicName, .animation:
            return String.self
            
        case .color, .textColor:
            return UIColor.self
        
        case .tone:
            return Tone.self
            
        case .hidden, .visible, .registered, .isPrintable, .gravity, .isDynamic, .allowsRotation, .allowsBorderPhysics:
            return Bool.self
            
        case .point, .position:
            return CGPoint.self
            
        case .positions:
            return Dictionary<String, CGPoint>.self
         
        case .sizes:
            return Dictionary<String, CGSize>.self
        
        case .vector, .velocity:
            return CGVector.self
            
        case .limit, .fontSize:
            return Int.self
            
        case .icon:
            return UIImage.self
            
        case .array:
            return PlaygroundValueArray.self
            
        case .dictionary:
            return PlaygroundValueDictionary.self
                        
        case .assessmentStatus:
            return PlaygroundPage.AssessmentStatus.self

        case .action:
            return SKAction.self
            
        case .rotations, .duration, .xScale, .yScale:
            return Double.self
            
        case .touch:
            return Touch.self
            
        case .collision:
            return Collision.self
            
        case .graphic:
            return Graphic.self
            
        case .graphics:
            return Array<Graphic>.self
            
        case .animationSequence:
            return Array<String>.self
            
        case .overlay:
            return Overlay.self
            
        case .sound:
            return Sound.self
            
        case .instrument:
            return Instrument.Kind.self
            
        case .note:
            return Double.self
            
        case .numberOfAnimations, .volume:
            return Int.self
            
        case .columns, .rows:
            return Int.self
        
        case .accessibilityHints:
            return AccessibilityHints.self
        
        case .anchor:
            return AnchorPoint.self
        }
    }
    
    func decoded(playgroundValue: PlaygroundValue) -> PlaygroundValueTransformable? {
        return transformable.from(playgroundValue)
    }
    
}

// MARK: Message Definition

public indirect enum Message: RawRepresentable {
    
    public typealias RawValue  = PlaygroundValue
    
    // Scene modification
    case setBorderPhysics(Bool)
    case setSceneBackgroundColor(UIColor)
    case setSceneBackgroundImage(Image?)
    case setSceneGridVisible(Bool)
    case setLightSensorImage(UIImage?)
    case clearScene
    case placeGraphic(id: String, position: CGPoint, anchor: AnchorPoint, isPrintable: Bool)
    case updateGraphicAttributes(positions: [String:CGPoint], sizes: [String:CGSize])
    case removeGraphic(id: String)
    case setSceneGravity(vector: CGVector)
    
    // Node Lifetime Management
    case createNode(id: String, graphicName: String, graphicType: String)
    case deleteNode(id: String)
    case getGraphics
    case getGraphicsReply(graphics: [Graphic])
    case removedGraphic(id: String)

    // Image
    case setImage(id: String, image: Image?)
    case setTiledImage (id: String, image: Image?, columns: Int?, rows: Int?, isDynamic: Bool?)
    
    // Shape
    case setShape(id: String, shape: BasicShape?)
    
    // Text related
    case setText        (id: String, text: String?)
    case setTextColor   (id: String, color: UIColor)
    case setFontSize    (id: String, size: Int)
    case setFontName    (id: String, name: String)
    
    // Sprite properties
    case setAffectedByGravity(id: String, gravity: Bool)
    case setIsDynamic(id: String, isDynamic: Bool)
    case setAllowsRotation(id: String, allowsRotation: Bool)
    case setXScale(id: String, xScale: Double)
    case setYScale(id: String, yScale: Double)
    case setVelocity(id: String, velocity: CGVector)
    
    // Touch handling
    case registerTouchHandler(Bool)
    case sceneTouchEvent(Touch)
    case touchEventAcknowledgement
    
    // Collision Event
    case sceneCollisionEvent(Collision)
    
    // Sound
    case playSound(String, volume: Int)
    case playMusic(String, volume: Int)
    case playInstrument(kind: Instrument.Kind, note: Double, volume: Int)
    
    // SpriteKit Action handling
    case runAction(id: String, action: SKAction, key: String?)
    case runAnimation(id: String, animation: String, duration: Double, numberOfTimes: Int)
    case runCustomAnimation(id: String, animationSequence: [String], duration: Double, numberOfTimes: Int)
    case applyImpulse(id: String, vector: CGVector)
    case applyForce(id: String, vector: CGVector, duration: Double)
    
    // These are control related messages. They inform the User process how many messages it may send.
    case requestRateLimit
    case replyRateLimit(limit: Int)
    
    // Assessment
    case setAssessment(PlaygroundPage.AssessmentStatus)
    case trigger(AssessmentTrigger)
    
    // Overlays
    case useOverlay(Overlay)
    
    // Accessibility
    case setAXUITone(Tone)
    case setAXUIColor(Color)
    case setAccessibilityHints(id: String, hints: AccessibilityHints?)
    
    public init?(rawValue: RawValue) {
        guard case .dictionary(let info) = rawValue else { return nil }
        let decoder = MessageDecoder(from: info)
        guard let messageType = decoder.messageType else { return nil }
        
        switch messageType {
            
        case .playSound:
            if let name = decoder.name, let volume = decoder.volume {
                self = .playSound(name, volume: volume)
                return
            }
            
        case .playMusic:
            if let name = decoder.name, let volume = decoder.volume {
                self = .playMusic(name, volume: volume)
                return
            }
            
        case .playInstrument:
            if let instrument = decoder.instrument, let note = decoder.note, let volume = decoder.volume {
                self = .playInstrument(kind: instrument, note: note, volume: volume)
                return
            }
            
        case .setBorderPhysics:
            if let allowsBorderPhysics = decoder.allowsBorderPhysics {
                self = .setBorderPhysics(allowsBorderPhysics)
                return
            }
            
        case .setSceneBackgroundColor:
            if let color = decoder.color {
                self = .setSceneBackgroundColor(color)
                return
            }
            
        case .setSceneGridVisible:
            if let isVisible = decoder.isVisible {
                self = .setSceneGridVisible(isVisible)
                return
            }
            
        case .setAffectedByGravity:
            if let id = decoder.id, let gravity = decoder.gravity {
                self = .setAffectedByGravity(id: id, gravity: gravity)
                return
            }
            
        case .setIsDynamic:
            if let id = decoder.id, let isDynamic = decoder.isDynamic {
                self = .setIsDynamic(id: id, isDynamic: isDynamic)
                return
            }
            
        case .setAllowsRotation:
            if let id = decoder.id, let allowsRotation = decoder.allowsRotation {
                self = .setAllowsRotation(id: id, allowsRotation: allowsRotation)
                return
            }
            
        case .setXScale:
            if let id = decoder.id, let xScale = decoder.xScale {
                self = .setXScale(id: id, xScale: xScale)
                return
            }
            
        case .setYScale:
            if let id = decoder.id, let yScale = decoder.yScale {
                self = .setYScale(id: id, yScale: yScale)
                return
            }
            
        case .setSceneGravity:
            if let vector = decoder.vector {
                self = .setSceneGravity(vector: vector)
                return
            }
            
        case .setVelocity:
            if let id = decoder.id, let velocity = decoder.velocity {
                self = .setVelocity(id: id, velocity: velocity)
                return
            }
            
        case .setSceneBackgroundImage:
            if let image = decoder.image {
                self = .setSceneBackgroundImage(image)
                return
            }
            
        case .setLightSensorImage:
            if let image = decoder.icon {
                self = .setLightSensorImage(image)
                return
            }
            
        case .clearScene:
            self = .clearScene
            return
            
        case .registerTouchHandler:
            if let registered = decoder.isRegistered {
                self = .registerTouchHandler(registered)
                return
            }
            
        case .sceneTouchEvent:
            if  let touch = decoder.touch {
                self = .sceneTouchEvent(touch)
                return
            }
        
        case .sceneCollisionEvent:
            if let collision = decoder.collision {
                self = .sceneCollisionEvent(collision)
                return
            }
            
        case .createNode:
            if let id = decoder.id, let graphicName = decoder.graphicName,  let graphicType = decoder.graphicType {
                self = .createNode(id: id, graphicName: graphicName, graphicType: graphicType)
                return
            }
            
        case .deleteNode:
            if let id = decoder.id {
                self = .deleteNode(id: id)
                return
            }
            
        case .setImage:
            if let id = decoder.id, let image = decoder.image {
                self = .setImage(id: id, image: image)
                return
            }
            
        case .setShape:
            if let id = decoder.id, let shape = decoder.shape {
                self = .setShape(id: id, shape: shape)
                return
            }

        case .setTiledImage:
            if let id = decoder.id, let image = decoder.image, let columns = decoder.columns, let rows = decoder.rows, let isDynamic = decoder.isDynamic {
                self = .setTiledImage(id: id, image: image, columns: columns, rows: rows, isDynamic: isDynamic)
                return
            }
            
        case .runAction:
            if let id = decoder.id, let action = decoder.action {
                self = .runAction(id: id, action: action, key: decoder.key)
                return
            }
            
        case .runAnimation:
            if let id = decoder.id, let animation = decoder.animation, let duration = decoder.duration, let numberOfTimes = decoder.numberOfAnimations  {
                self = .runAnimation(id: id, animation: animation, duration: duration, numberOfTimes: numberOfTimes)
                return
            }
            
        case .runCustomAnimation:
            if let id = decoder.id, let animationSequence = decoder.animationSequence, let duration = decoder.duration, let numberOfTimes = decoder.numberOfAnimations {
                self = .runCustomAnimation(id: id, animationSequence: animationSequence, duration: duration, numberOfTimes: numberOfTimes)
                return
            }

        case .setAssessment:
            guard let status = decoder.assessmentStatus else { return nil }
            self = .setAssessment(status)
            return
            
        case .applyImpulse:
            if
                let id = decoder.id,
                let vector = decoder.vector {
                self = .applyImpulse(id: id, vector: vector)
                return
            }
            
        case .applyForce:
            if
                let id = decoder.id,
                let vector = decoder.vector,
                let duration = decoder.duration {
                self = .applyForce(id: id, vector: vector, duration: duration)
                return
            }
            
        case .trigger:
            if let assessmentTrigger = decoder.assessmentTrigger {
                self = .trigger(assessmentTrigger)
                return
            }

        case .placeGraphic:
            if let id = decoder.id, let position = decoder.position, let anchor = decoder.anchor, let isPrintable = decoder.isPrintable {
                self = .placeGraphic(id: id, position: position, anchor: anchor, isPrintable: isPrintable)
                return
            }
        
        case .updateGraphicAttributes:
            if let positions = decoder.positions, let sizes = decoder.sizes {
                self = .updateGraphicAttributes(positions: positions, sizes: sizes)
                return
            }
            
        case .removeGraphic:
            if let id = decoder.id {
                self = .removeGraphic(id: id)
                return
            }
            
        case .removedGraphic:
            if let id = decoder.id {
                self = .removedGraphic(id: id)
                return
            }

        case .setText:
            if let id = decoder.id {
                self = .setText(id: id, text: decoder.text)
                return
            }
            
        case .setTextColor:
            if let id = decoder.id, let color = decoder.textColor {
                self = .setTextColor(id: id, color: color)
                return
            }
            
        case .setFontName:
            if let id = decoder.id, let fontName = decoder.fontName {
                self = .setFontName(id: id, name: fontName)
                return
            }
            
        case .setFontSize:
            if let id = decoder.id, let fontSize = decoder.fontSize {
                self = .setFontSize(id: id, size: fontSize)
                return
            }
            
        case .getGraphics:
            self = .getGraphics
            return
            
        case .getGraphicsReply:
            if let graphics = decoder.graphics {
                self = .getGraphicsReply(graphics: graphics)
                return
            }
            else {
                // If there are no graphics currently in the scene, return an empty array
                self = .getGraphicsReply(graphics: [Graphic]())
                return
            }
            
        case .touchEventAcknowledgement:
            self = .touchEventAcknowledgement
            return
            
        case .overlay:
            if let overlay = decoder.overlay {
                self = .useOverlay(overlay)
                return
            }
        
        case .axUITone:
            if let tone = decoder.tone {
                self = .setAXUITone(tone)
                return
            }
            
        case .axUIColor:
            if let color = decoder.color {
                self = .setAXUIColor(color)
                return
            }
        
        case .setAccessibilityHints:
            if let id = decoder.id {
                self = .setAccessibilityHints(id: id, hints:decoder.hints)
                return
            }
        
        default:
            ()
        }
        
        return nil
    }
    
    
    public var rawValue: PlaygroundValue {
        
        var encoder = MessageEncoder()
        
        switch self {
        
        case .playSound(let name, let volume):
            encoder.messageType = .playSound
            encoder.volume = volume
            encoder.name = name
            
        case .playMusic(let name, let volume):
            encoder.messageType = .playMusic
            encoder.volume = volume
            encoder.name = name
            
        case .playInstrument(let kind, let note, let volume):
            encoder.messageType = .playInstrument
            encoder.instrument = kind
            encoder.note = note
            encoder.volume = volume
            
        case .setBorderPhysics(let allowsBorderPhysics):
            encoder.messageType = .setBorderPhysics
            encoder.allowsBorderPhysics = allowsBorderPhysics
            
        case .setSceneBackgroundColor(let color):
            encoder.messageType =  .setSceneBackgroundColor
            encoder.color = color
            
        case .setSceneBackgroundImage(let image?):
                encoder.messageType = .setSceneBackgroundImage
                encoder.image = image
            
        case .setSceneGridVisible(let isGridVisible):
            encoder.messageType = .setSceneGridVisible
            encoder.isVisible = isGridVisible
            
        case .setLightSensorImage(let image?):
            encoder.messageType = .setLightSensorImage
            encoder.icon = image
            
        case .clearScene:
            encoder.messageType = .clearScene
            
        case .registerTouchHandler(let registered):
            encoder.messageType = .registerTouchHandler
            encoder.isRegistered = registered
            
        case .sceneTouchEvent(let touch):
            encoder.messageType = .sceneTouchEvent
            encoder.touch = touch
            
        case .sceneCollisionEvent(let collision):
            encoder.messageType = .sceneCollisionEvent
            encoder.collision = collision
            
        case .createNode(let id, let graphicName, let graphicType):
            encoder.messageType = .createNode
            encoder.graphicName = graphicName
            encoder.id = id
            encoder.graphicType = GraphicType(rawValue: graphicType)
            
        case .deleteNode(let id):
            encoder.messageType = .deleteNode
            encoder.id = id
            
        case .requestRateLimit:
            encoder.messageType = .requestRateLimit
            
        case .replyRateLimit(let limit):
            encoder.messageType = .replyRateLimit
            encoder.limit = limit

        case .setImage(let id, image: let image):
            encoder.messageType = .setImage
            encoder.id = id
            encoder.image = image
            
        case .setShape(let id, shape: let shape):
            encoder.messageType = .setShape
            encoder.id = id
            encoder.shape = shape
            
        case .setTiledImage(let id, image: let image, let columns, let rows, let isDynamic):
            encoder.messageType = .setTiledImage
            encoder.id = id
            encoder.image = image
            encoder.columns = columns
            encoder.isDynamic = isDynamic
            encoder.rows = rows
            
        case .setAffectedByGravity(let id, let gravity):
            encoder.messageType = .setAffectedByGravity
            encoder.id = id
            encoder.isAffectedByGravity = gravity
            
        case .setIsDynamic(let id, let isDynamic):
            encoder.messageType = .setIsDynamic
            encoder.id = id
            encoder.isDynamic = isDynamic
            
        case .setAllowsRotation(let id, let allowsRotation):
            encoder.messageType = .setAllowsRotation
            encoder.id = id
            encoder.allowsRotation = allowsRotation
            
        case .setXScale(let id, let xScale):
            encoder.messageType = .setXScale
            encoder.id = id
            encoder.xScale = xScale
            
        case .setYScale(let id, let yScale):
            encoder.messageType = .setYScale
            encoder.id = id
            encoder.yScale = yScale
            
        case .setSceneGravity(let vector):
            encoder.messageType = .setSceneGravity
            encoder.vector = vector
         
        case .runAction(let id, let action, let key):
            encoder.messageType = .runAction
            encoder.id = id
            encoder.action = action
            encoder.key = key
            
        case .runAnimation(let id, let animation, let duration, let numberOfTimes):
            encoder.messageType = .runAnimation
            encoder.id = id
            encoder.numberOfAnimations = numberOfTimes
            encoder.animation = animation
            encoder.duration = duration
            
        case .runCustomAnimation(let id, let animationSequence, let duration, let numberOfTimes):
            encoder.messageType = .runCustomAnimation
            encoder.id = id
            encoder.animationSequence = animationSequence
            encoder.duration = duration
            encoder.numberOfAnimations = numberOfTimes
            
        case .setAssessment(let status):
            encoder.messageType = .setAssessment
            encoder.assessmentStatus = status
            
        case .applyImpulse(let id, let vector):
            encoder.messageType = .applyImpulse
            encoder.id = id
            encoder.vector = vector
            
        case .applyForce(let id, let vector, let duration):
            encoder.messageType = .applyForce
            encoder.id = id
            encoder.vector = vector
            encoder.duration = duration
            
        case .setVelocity(let id, let velocity):
            encoder.messageType = .setVelocity
            encoder.id = id
            encoder.velocity = velocity
            
        case .trigger(let assessmentTrigger):
            encoder.messageType = .trigger
            encoder.assessmentTrigger = assessmentTrigger
           
        case .placeGraphic(let id, let position, let anchor, let isPrintable):
            encoder.messageType = .placeGraphic
            encoder.id = id
            encoder.position = position
            encoder.anchor = anchor
            encoder.isPrintable = isPrintable
            
        case .updateGraphicAttributes(let positions, let sizes):
            encoder.messageType = .updateGraphicAttributes
            encoder.positions = positions
            encoder.sizes = sizes
            
        case .removeGraphic(let id):
            encoder.messageType = .removeGraphic
            encoder.id = id
            
        case .removedGraphic(let id):
            encoder.messageType = .removedGraphic
            encoder.id = id
            
        case .setText(let id, let text):
            encoder.messageType = .setText
            encoder.id = id
            encoder.text = text
        
        case .setTextColor(let id, let color):
            encoder.messageType = .setTextColor
            encoder.id = id
            encoder.textColor = color
            
        case .setFontName(let id, let name):
            encoder.messageType = .setFontName
            encoder.id = id
            encoder.fontName = name
            
        case .setFontSize(let id, let size):
            encoder.messageType = .setFontSize
            encoder.id = id
            encoder.fontSize = size

        case .getGraphics:
            encoder.messageType = .getGraphics
         
        case .getGraphicsReply(let graphics):
            encoder.messageType = .getGraphicsReply
            encoder.graphics = graphics
            
        case .touchEventAcknowledgement:
            encoder.messageType = .touchEventAcknowledgement
            
        case .useOverlay(let overlay):
            encoder.messageType = .overlay
            encoder.overlay = overlay
        
        case .setAXUITone(let tone):
            encoder.messageType = .axUITone
            encoder.tone = tone
        
        case .setAXUIColor(let color):
            encoder.messageType = .axUIColor
            encoder.color = color
        
        case .setAccessibilityHints(let id, let hints):
            encoder.messageType = .setAccessibilityHints
            encoder.id = id
            encoder.accessibilityHints = hints
            
        default:
            ()
        }
        
        precondition(encoder.messageType != nil, "[error] messageType must be set on an MessageEncoder to be in a valid state.")
        return encoder.playgroundValue
    }
    
}


// MARK: Message Sending

public typealias MessageDestination = Environment


public extension Message {
    
    public func send(to: MessageDestination = .live) {
        
        switch to {
        case .live:
            guard let proxy = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else { return }
            proxy.send(rawValue)
            
        case .user:
            guard let liveViewMessageHandler = PlaygroundPage.current.liveView as? PlaygroundLiveViewMessageHandler else { return }
            liveViewMessageHandler.send(rawValue)
        }
    }
}



protocol MessageControl {
    
    var suppressMessageSending: Bool { get set }
}

