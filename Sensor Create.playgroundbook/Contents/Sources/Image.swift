// 
//  Image.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit

public class Image: _ExpressibleByImageLiteral, Equatable, Hashable {
    
    let path: String
    let description: String
    
    public required init(imageLiteralResourceName path: String) {
        self.path = path
        self.description = Image.parseDescription(from: path)
    }    
    
    public static func ==(lhs: Image, rhs: Image) -> Bool {
        return lhs.path == rhs.path
    }
    
    lazy public var size: CGSize = { [unowned self] in
        let image = UIImage(imageLiteralResourceName: path)
        return image.size
    }()
    
    public var hashValue: Int {
        return path.hashValue
    }
    
    public var isEmpty: Bool {
        return path.count == 0
    }

    static private func parseDescription(from path: String) -> String {
        var name = URL(fileURLWithPath: path).deletingPathExtension().lastPathComponent
        if let atCharRange = name.range(of: "@") {
            name = String(name[..<atCharRange.lowerBound])
        }

        return name
    }
}

// MARK: Background image overlays

public enum Overlay : Int {
    case gridWithCoordinates
    case cosmicBus
    
    func image() -> Image {
        switch self {
        case .gridWithCoordinates:
            return Image(imageLiteralResourceName: "GridCoordinates")
        case .cosmicBus:
            return Image(imageLiteralResourceName: "CosmicBus")
        }
    }
}
