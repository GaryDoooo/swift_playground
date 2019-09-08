// 
//  DynamicComposerViewController.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//


import UIKit
import UIKit.UIGestureRecognizerSubclass
import PlaygroundSupport
import Foundation
import SpriteKit

public let sceneSize = CGSize(width:1000, height: 1000)
public let baseContentEdgeLength : CGFloat = 512 // The size of the live view in landscape on an iPad
public let contentInset : CGFloat = 10 // The amount we'll inset the edge length to pull it away from the edge

public class DynamicComposerViewController : UIViewController, PlaygroundLiveViewSafeAreaContainer, UIGestureRecognizerDelegate, LiveViewSceneDelegate {
    
    var messageProcessingQueue: DispatchQueue? = nil
    let skView = LiveView(frame: .zero)
    let masterStackView = UIStackView(arrangedSubviews: [])
    let masterContentView = UIView(frame: .zero)
    let axUIStackView = UIStackView(arrangedSubviews:[])
    let axUIToneView = ToneAccessibilityView(frame: .zero)
    let axUILightView = LightAccessibilityView(frame: .zero)
    let liveViewScene = LiveViewScene(size: sceneSize)
    let backgroundView = UIView(frame: .zero)
    let audioBarButton = BarButton()
    let axUIBarButton = BarButton()
    
    var sendTouchEvents:Bool = false
    var constraintsAdded = false
    var standardBackgroundImageSet = false
    
    var accessibilityUIEnabled: Bool = false {
        didSet {
            updateAXUIButton()
        }
    }
    
    private var skViewCenterXConstraint : NSLayoutConstraint?
    private var skViewCenterYConstraint : NSLayoutConstraint?
    private var bgImageViewCenterXConstraint : NSLayoutConstraint?
    private var bgImageViewCenterYConstraint : NSLayoutConstraint?

    public var backgroundImage : Image? {
        didSet {
            var image : UIImage?
            if let bgImage = backgroundImage {
                image = UIImage(named: bgImage.path)
                
                standardBackgroundImageSet = false
            }
            else {
                // Default to the friends background when the background image
                image = UIImage(named:"background5")
                
                standardBackgroundImageSet = true
            }

            guard let imageView = backgroundView.subviews[0] as? UIImageView else { fatalError("failed to find backgroundImage imageView") }
            imageView.image = image
            imageView.contentMode = .center
        }
    }
    
    public var lightSensorImage : UIImage? {
        didSet {
            var image : UIImage?
            if var lsImage = lightSensorImage {
                
                if interfaceOrientation != .landscapeRight, let cgImage = lsImage.cgImage {
                    var orientation = UIImageOrientation.up
                    
                    // rotate image if necessary
                    if interfaceOrientation == .portrait {
                        orientation = .left
                    } else if interfaceOrientation == .landscapeLeft {
                        orientation = .down
                    } else if interfaceOrientation == .portraitUpsideDown {
                        orientation = .right
                    }
                    
                    lsImage = UIImage(cgImage: cgImage, scale: 1.0, orientation: orientation)
                }
                
                // don't override a set background
                if standardBackgroundImageSet || backgroundImage == nil {
                    image = lsImage
                    
                    guard let imageView = backgroundView.subviews[0] as? UIImageView else { fatalError("failed to find backgroundImage imageView") }
                    imageView.image = image
                    imageView.contentMode = .scaleAspectFit
                }
            } else {
                // Default to the friends background when the background image
                backgroundImage = nil
            }
        }
    }
    
    // MARK: View Controller Lifecycle
    
    public override func viewDidLoad() {
        Process.setIsLive()
        // The scene needs to inform us of some events
        liveViewScene.sceneDelegate = self
        // Because the background image is *not* part of the scene itself, transparency is needed for the view and scene
        skView.allowsTransparency = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        skView.translatesAutoresizingMaskIntoConstraints = false
        masterStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundView)
        masterContentView.addSubview(skView)
        
        NSLayoutConstraint.activate([
            masterContentView.widthAnchor.constraint(equalTo: masterContentView.heightAnchor),
            masterContentView.heightAnchor.constraint(equalTo: masterContentView.widthAnchor),
        ])
        
        view.addSubview(masterStackView)
        
        NSLayoutConstraint.activate([
            masterStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            masterStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            masterStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            masterStackView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -160)
        ])
        
        masterStackView.addArrangedSubview(masterContentView)
        masterStackView.addArrangedSubview(axUIStackView)
        
        axUIStackView.isHidden = true
        axUIStackView.alpha = 0.0
        
        skView.presentScene(liveViewScene)

        func _constrainCenterAndSize(parent: UIView, child: UIView) {
            child.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                child.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
                child.centerYAnchor.constraint(equalTo: parent.centerYAnchor),
                child.widthAnchor.constraint(equalTo: parent.widthAnchor),
                child.heightAnchor.constraint(equalTo: parent.heightAnchor)
                ])
        }

        let borderColorView = AddressableContentBorderView(frame: .zero)
        skView.addSubview(borderColorView)
        _constrainCenterAndSize(parent: skView, child: borderColorView)
        
        // Create a blue background image
        let image : UIImage? = {
            UIGraphicsBeginImageContextWithOptions(CGSize(width:2500, height:2500), false, 2.0)
            #colorLiteral(red: 0.1911527216, green: 0.3274578452, blue: 0.4287572503, alpha: 1).set()
            UIRectFill(CGRect(x: 0, y: 0, width: 2500, height: 2500))
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }()
        let defaultBackgroundView = UIImageView(image:image)
        defaultBackgroundView.contentMode = .center
        defaultBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(defaultBackgroundView)
        
        audioBarButton.translatesAutoresizingMaskIntoConstraints = false
        audioBarButton.addTarget(self, action: #selector(didTapAudioBarButton(_:)), for: .touchUpInside)
        view.addSubview(audioBarButton)
        
        skViewCenterXConstraint = skView.centerXAnchor.constraint(equalTo: masterContentView.centerXAnchor)
        skViewCenterYConstraint = skView.centerYAnchor.constraint(equalTo: masterContentView.centerYAnchor)
        
        _constrainCenterAndSize(parent: view, child: masterStackView)
        _constrainCenterAndSize(parent: view, child: backgroundView)
        _constrainCenterAndSize(parent: backgroundView, child: defaultBackgroundView)
        
        // Grab references to the background imageview's center x/y constraints so that we can pan the background
        bgImageViewCenterXConstraint = backgroundView.constraints.filter { $0.firstAttribute == .centerX }.first
        bgImageViewCenterYConstraint = backgroundView.constraints.filter { $0.firstAttribute == .centerY }.first

        NSLayoutConstraint.activate([
            skViewCenterXConstraint!,
            skViewCenterYConstraint!,
            audioBarButton.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor, constant: 20),
            audioBarButton.trailingAnchor.constraint(equalTo: liveViewSafeAreaGuide.trailingAnchor, constant: -20),
            audioBarButton.widthAnchor.constraint(equalToConstant: 44),
            audioBarButton.heightAnchor.constraint(equalToConstant: 44)
            ])
        
        updateAudioButton()
        updateStackViews()
        registerForTapGesture()
    }

    public override func viewWillAppear(_ animated: Bool) {
        guard constraintsAdded == false else { return }
        if let parentView = self.view.superview {
            NSLayoutConstraint.activate([
                view.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
                view.centerYAnchor.constraint(equalTo: parentView.centerYAnchor),
                view.widthAnchor.constraint(equalTo: parentView.widthAnchor),
                view.heightAnchor.constraint(equalTo: parentView.heightAnchor)])
        }
        constraintsAdded = true
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        let _ = updateMinimumAllowedEdgeLength(proposedSize: nil)
    }
    
    // MARK: Layout
        
    private var currentContentEdgeLength : CGFloat?
    private var minimumAllowedEdgeLength : CGFloat = baseContentEdgeLength - contentInset
    private var maximumAllowedEdgeLength : CGFloat {
        get {
            return  2 * minimumAllowedEdgeLength
        }
    }
    private var currentBGImageViewTransform : CGAffineTransform?

    // Returns the shorter edge of the size
    private func updateMinimumAllowedEdgeLength(proposedSize: CGSize?) -> CGFloat {
        var size = proposedSize
        if size == nil {
            size = view.bounds.size
        }
        
        var shorterEdge : CGFloat = 0
        var safeAreaInset : CGFloat = 0
        if size!.width < size!.height {
            shorterEdge = size!.width
            safeAreaInset = max(self.liveViewSafeAreaGuide.layoutFrame.origin.x, self.view.frame.size.width - self.liveViewSafeAreaGuide.layoutFrame.size.width)
        }
        else {
            shorterEdge = size!.height
            safeAreaInset = max(self.liveViewSafeAreaGuide.layoutFrame.origin.y, self.view.frame.size.height - self.liveViewSafeAreaGuide.layoutFrame.size.height)
        }
        
        minimumAllowedEdgeLength = shorterEdge - safeAreaInset - contentInset
        
        return shorterEdge
    }
    
    private func recenterSceneForLiveViewSize(size: CGSize) {
        let _ = skView.contentEdgeLength
        let _ = updateMinimumAllowedEdgeLength(proposedSize: size)
        
        skView.contentEdgeLength = minimumAllowedEdgeLength
        self.skView.invalidateIntrinsicContentSize()
        if let xCons = skViewCenterXConstraint, let yCons = skViewCenterYConstraint,
            let bgxCons = bgImageViewCenterXConstraint, let bgyCons = bgImageViewCenterYConstraint {
            xCons.constant = 0
            yCons.constant = 0

            bgxCons.constant = 0
            bgyCons.constant = 0
        }
    }
    
    private var oldViewSize : CGSize = .zero
    public override func viewWillLayoutSubviews() {
        if view.bounds.size != oldViewSize {
            recenterSceneForLiveViewSize(size: view.bounds.size)
            updateStackViews()
            oldViewSize = view.bounds.size
        }
    }
    
    // MARK: Audio
    
    private func updateAudioButton() {
        audioBarButton.setTitle(nil, for: .normal)
        let allAudioEnabled = audioController.isAllAudioEnabled
        let iconImage = allAudioEnabled ? UIImage(named: "AudioOn") : UIImage(named: "AudioOff")
        audioBarButton.accessibilityLabel = allAudioEnabled ?
            NSLocalizedString("Sound On", comment: "AX hint for Sound On button") :
            NSLocalizedString("Sound Off", comment: "AX hint for Sound Off button")
        audioBarButton.setImage(iconImage, for: .normal)
    }
    
    private func updateAXUIButton() {
        if axUIBarButton.superview == nil {
            axUIBarButton.translatesAutoresizingMaskIntoConstraints = false
            axUIBarButton.addTarget(self, action: #selector(didTapAXUIBarButton(_:)), for: .touchUpInside)
            view.addSubview(axUIBarButton)
            
            NSLayoutConstraint.activate([
                axUIBarButton.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor, constant: 20),
                axUIBarButton.trailingAnchor.constraint(equalTo: liveViewSafeAreaGuide.trailingAnchor, constant: -80),
                axUIBarButton.widthAnchor.constraint(equalToConstant: 44),
                axUIBarButton.heightAnchor.constraint(equalToConstant: 44)
                ])
        }
        
        axUIBarButton.setTitle(nil, for: .normal)
        let iconImage = UIImage(named: "AXUIToggle")
        axUIBarButton.accessibilityLabel = accessibilityUIEnabled ?
            NSLocalizedString("Accessibility UI On", comment: "AX hint for Accessibility UI On button") :
            NSLocalizedString("Accessibility UI Off", comment: "AX hint for Accessibility UI Off button")
        axUIBarButton.setImage(iconImage, for: .normal)
    }
    
    private func updateStackViews() {
        let horizontalLayout = self.view.frame.size.width > self.view.frame.size.height
        
        masterStackView.axis = horizontalLayout ? .horizontal : .vertical
        masterStackView.distribution = .fill
        masterStackView.alignment = .center
        masterStackView.spacing = 5.0
        
        axUIStackView.axis = horizontalLayout ? .vertical : .horizontal
        axUIStackView.distribution = .fill
        axUIStackView.alignment = .center
        axUIStackView.spacing = 10.0
    }
    
    private func animateAccessibilityUI() {
        updateAXUIButton()
        
        UIView.animate(withDuration: 0.3) {
            if self.accessibilityUIEnabled {
                self.axUIStackView.isHidden = false
                self.axUIStackView.alpha = 1.0
            } else {
                self.axUIStackView.alpha = 0.0
                self.axUIStackView.isHidden = true
            }
            
            self.masterStackView.layoutIfNeeded()
        }
    }

    /// Dismisses the audio menu if visible. Returns true if there was a menu to dismiss
    @discardableResult
    func dismissAudioMenu() -> Bool {
        if let vc = presentedViewController as? AudioMenuController {
            vc.dismiss(animated: true, completion: nil)
            return true
        }
        return false
    }
    
    // MARK: Actions

    @objc
    func didTapAudioBarButton(_ button: UIButton) {
        if dismissAudioMenu() {
            // Just dismissing a previously presented `AudioMenuController`.
            return
        }
        
        let menu = AudioMenuController()
        menu.modalPresentationStyle = .popover
        menu.popoverPresentationController?.passthroughViews = [view]
        menu.popoverPresentationController?.backgroundColor = .white
        
        menu.popoverPresentationController?.permittedArrowDirections = .up
        menu.popoverPresentationController?.sourceView = button
        
        // Offset the popup arrow under the button.
        menu.popoverPresentationController?.sourceRect = CGRect(x: 0, y: 5, width: 44, height: 44)
        
        menu.popoverPresentationController?.delegate = self
        menu.backgroundAudioEnabled = audioController.isBackgroundAudioEnabled
        menu.soundEffectsAudioEnabled = audioController.isSoundEffectsAudioEnabled
        menu.delegate = self
        
        present(menu, animated: true, completion: nil)
    }
    
    // MARK: Tap Gesture
    
    func registerForTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapAction(_ recognizer: UITapGestureRecognizer) {
        dismissAudioMenu()
    }
    
    @objc
    func didTapAXUIBarButton(_ sender: Any) {
        accessibilityUIEnabled = !accessibilityUIEnabled
        
        animateAccessibilityUI()
    }
}

public class LiveView : SKView, PlaygroundLiveViewSafeAreaContainer {
    public var contentEdgeLength : CGFloat = baseContentEdgeLength - contentInset
    override public var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: contentEdgeLength, height: contentEdgeLength)
        }
    }
    
    override public func contentCompressionResistancePriority(for axis: UILayoutConstraintAxis) -> UILayoutPriority {
        return .defaultLow
    }
}

public class SelfIgnoringView : UIView {
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if (view == self) {
            return nil
        }
        return view
    }
}

public class AddressableContentBorderView : SelfIgnoringView {
    override public var isOpaque: Bool {
        set {}
        get { return false }
    }
    override public func draw(_ rect: CGRect) {
        UIColor.clear.set()
        let path = UIBezierPath(rect: self.bounds)
        path.fill()

        let pattern = Array<CGFloat>(arrayLiteral: 3.0, 3.0)
        path.setLineDash(pattern, count: 2, phase: 0.0)
        path.lineJoinStyle = .round
        UIColor.white.set()
        path.stroke()
    }
}

extension DynamicComposerViewController : PlaygroundLiveViewMessageHandler {
    
    public func liveViewMessageConnectionOpened() {
        PBLog()
        messageProcessingQueue = DispatchQueue(label: "Message Processing Queue")
        liveViewScene.connectedToUserCode()
    }
    
    public func liveViewMessageConnectionClosed() {
        PBLog()
        liveViewScene.disconnectedFromUserCode()
    }
    
    public func receive(_ message: PlaygroundValue) {
        messageProcessingQueue?.async { [unowned self] in
            self.processMessage(message)
        }
    }
    
    private func processMessage(_ message: PlaygroundValue) {
        guard let unpackedMessage = Message(rawValue: message) else {
            return
        }

        switch unpackedMessage {
   
        case .registerTouchHandler(let registered):
            DispatchQueue.main.async { [unowned self] in
                self.sendTouchEvents = registered
            }
            
        case .setAXUITone(_):
            DispatchQueue.main.async { [unowned self] in
                if !self.axUIStackView.arrangedSubviews.contains(self.axUIToneView) {
                    self.axUIStackView.addArrangedSubview(self.axUIToneView)
                    
                    self.axUIToneView.delegate = self
                    
                    self.updateAXUIButton()
                }
            }
        
        case .setAXUIColor(_):
            DispatchQueue.main.async { [unowned self] in
                if !self.axUIStackView.arrangedSubviews.contains(self.axUILightView) {
                    self.axUIStackView.addArrangedSubview(self.axUILightView)
                    
                    self.axUILightView.delegate = self
                    
                    self.updateAXUIButton()
                }
            }
          
        default:
            self.liveViewScene.handleMessage(message: unpackedMessage)
        }
    }
    
}

extension DynamicComposerViewController: AudioMenuDelegate {
    // MARK: AudioMenuDelegate
    
    func enableSoundEffectsAudio(_ isEnabled: Bool) {
        audioController.isSoundEffectsAudioEnabled = isEnabled
        updateAudioButton()
    }
    
    func enableBackgroundAudio(_ isEnabled: Bool) {
        audioController.isBackgroundAudioEnabled = isEnabled
        updateAudioButton()
        
        // Resume (actually restart) background audio if it had been playing.
        if isEnabled, let backgroundMusic = audioController.backgroundAudioMusic {
            audioController.playBackgroundAudioLoop(backgroundMusic)
        }
    }
}

extension DynamicComposerViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension DynamicComposerViewController: ToneAccessibilityDelegate {
    public func accessibilityToneGenerated(tone: Tone) {
        liveViewScene.enqueue(.setAXUITone(tone))
    }
}

extension DynamicComposerViewController: LightAccessibilityDelegate {
    public func accessibilityColorGenerated(color: Color) {
        liveViewScene.enqueue(.setAXUIColor(color))
    }
}

