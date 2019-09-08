//
//  Direction.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import Foundation

/// Enum for indicating direction on the grid (North, South, East, and West).
/// - localizationKey: Direction
public enum Direction {
    case north, south, east, west
    
    /// All the valid directions (North, South, East, and West).
    /// - localizationKey: Direction.all
    public static let all: [Direction] = [.north, .east, .south, .west]
}
