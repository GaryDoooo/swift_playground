//
//  ToneAccessibilityView.swift
//  SupportingContent
//
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

protocol ToneAccessibilityDelegate {
    func accessibilityToneGenerated(tone: Tone)
}

class ToneAccessibilityView : UIView {
    private let toneImage = UIImage(named: "AXUITone")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(toneGesture(sender:)))
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(toneGesture(sender:)))
        
        longPressGestureRecognizer.minimumPressDuration = 0.0
        
        addGestureRecognizer(panGestureRecognizer)
        addGestureRecognizer(longPressGestureRecognizer)
        
        let imageView = UIImageView(image: toneImage)
        
        self.frame.size = toneImage.size
        
        imageView.isAccessibilityElement = true
        imageView.accessibilityLabel = NSLocalizedString("Tone input region", comment: "AX: Tone input label")
        imageView.accessibilityHint = NSLocalizedString("Manually adjust Tone Sensor pitch and volume values. Slide left and right to adjust pitch. Slide up and down to adjust volume.", comment: "AX: Tone input hint")
        imageView.accessibilityTraits = UIAccessibilityTraitAllowsDirectInteraction
        
        self.addSubview(imageView)
    }
    
    var tone:Tone = Tone(pitch: 0.0, volume: 0.0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var delegate: ToneAccessibilityDelegate?
    
    override var intrinsicContentSize: CGSize {
        return toneImage.size
    }
    
    @objc
    func toneGesture(sender: UIGestureRecognizer) {
        var tone: Tone?
        
        if (sender.state == .began || sender.state == .changed) && sender.numberOfTouches > 0 {
            let point = sender.location(ofTouch: 0, in: self)
            let marginInset = CGFloat(40.0)
            let toneFrame = CGRect(x: frame.origin.x + marginInset , y: frame.origin.y, width: frame.size.width - marginInset, height: frame.size.height - marginInset)
            
            if toneFrame.contains(point) {
                tone = Tone(pitch: Double((point.x - marginInset) / toneFrame.size.width) * 4000.0, volume: 1.0 - Double(point.y / toneFrame.size.height))
            } else {
                tone = nil
            }
        }
        
        if sender.state == .ended || tone == nil {
            tone = Tone(pitch: 0.0, volume: 0.0) // turn off last tone
        }
        
        if let delegate = delegate, let tone = tone {
            delegate.accessibilityToneGenerated(tone: tone)
        }
    }
}
