//
//  AccessibilityHints.swift
//  SupportingContent
//
//  Copyright © 2018 Apple Inc. All rights reserved.
//


public enum AccessibilityAction : Int, Codable {
    case tap
    case noAction
}

public struct AccessibilityHints : Codable {
    var makeAccessibilityElement: Bool = false      // should be treated as a UIAccessibilityElement by VoiceOver
    var accessibilityLabel: String?                 // e.g. localized "player"
    var action: AccessibilityAction = .noAction     // the VoiceOver rotor action associated with the accessibility element
    var selectImmediately: Bool = false             // have the live view select the accessibility element when placed
    
    public init(makeAccessibilityElement: Bool = false,
         accessibilityLabel: String? = nil,
         action: AccessibilityAction = .noAction,
         selectImmediately: Bool = false) {
        self.makeAccessibilityElement = makeAccessibilityElement
        self.accessibilityLabel = accessibilityLabel
        self.action = action
        self.selectImmediately = selectImmediately
    }
}
