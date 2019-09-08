// 
//  Tool.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import UIKit
import Foundation



struct ToolOptions: OptionSet {
    
    public let rawValue: Int8
    
    static let draggable            = ToolOptions(rawValue: 1 << 0)
    static let fingerMoveEvents     = ToolOptions(rawValue: 1 << 1)
    static let touchGraphicEvents   = ToolOptions(rawValue: 1 << 2)
    
    public init(rawValue: Int8) {
        self.rawValue = rawValue
    }
}


/// A tool that you can use to modify the scene by having your code respond to events, such as moving your finger across the scene or touching a graphic.
///
/// - localizationKey: Tool
public class Tool: Equatable {
    
    /// The name of the tool to be displayed on the toolbar.
    ///
    /// - localizationKey: Tool.name
    public var name: String

    /// The emoji icon to be displayed with the name on the toolbar. Any text beyond the first character is ignored.
    ///
    /// - localizationKey: Tool.emojiIcon
    public var emojiIcon: String
    
    let id: String

    static let move = SystemTool(name: NSLocalizedString("Move", comment: "Title for tool that moves graphics around the scene"), icon: Image(imageLiteralResourceName: "LtC3_Move"))
    static let erase = SystemTool(name: NSLocalizedString("Erase", comment: "Title for tool that erases graphics from the scene"), icon: Image(imageLiteralResourceName: "LtC3_Erase"))

    var options: ToolOptions = []
    
    
    var shouldDragGraphics: Bool  {
        get {
            return options.contains(.draggable)
        }
        
        set {
            if newValue {
                options.insert(.draggable)
            }
            else {
                options.remove(.draggable)
            }
        }
    }
    
    /// The function that's called when your finger moves across the scene. It's the event handler for “finger moved” events.
    ///
    /// - localizationKey: Tool.onFingerMoved
    public var onFingerMoved: ((Touch) -> Void)? {
        didSet {
            if let _ = onFingerMoved  {
                options.insert(.fingerMoveEvents)
            }
            else {
                options.remove(.fingerMoveEvents)
            }
        }
    }
    
    /// The function that's called when you touch a graphic on the scene. It's the event handler for “graphic touched” events.
    ///
    /// - localizationKey: Tool.onGraphicTouched
    public var onGraphicTouched: ((Graphic) -> Void)?  {
        didSet {
            if let _ = onGraphicTouched {
                options.insert(.touchGraphicEvents)
            }
            else {
                options.remove(.touchGraphicEvents)
            }
        }
    }
    
    
    init() {
        id = UUID().uuidString
        name = ""
        emojiIcon = ""
    }
    
    
    public required init(id: String) {
        self.id = id
        name = ""
        emojiIcon = ""
    }
    
    
    /// Creates a tool with a name and an optional single-character emoji icon.
    ///
    /// - Parameter name: The name of the tool.
    /// - Parameter emojiIcon: The single-character emoji to display alongside the name.
    ///
    /// - localizationKey: Tool(name:emojiIcon:)
    public convenience init(name: String, emojiIcon: String) {
        
        self.init()
        self.name = name
        guard emojiIcon.count > 0 else { return }
        self.emojiIcon = String(emojiIcon[emojiIcon.startIndex])
    }
    
    public static func ==(lhs: Tool, rhs: Tool) -> Bool {
        return lhs.name == rhs.name
    }

}

internal class SystemTool : Tool {
    internal var icon: Image?

    required init(id: String) {
        super.init(id: id)
        self.icon = nil
    }

    internal init(name: String, emojiIcon: String = "", icon: Image) {
        super.init()
        self.name = name
        self.icon = icon
        guard emojiIcon.count > 0 else { return }
        self.emojiIcon = String(emojiIcon[emojiIcon.startIndex])
    }
}


