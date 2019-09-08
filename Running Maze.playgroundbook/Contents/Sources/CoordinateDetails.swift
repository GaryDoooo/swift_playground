//
//  CoordinateDetails.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import Foundation

/// Represents the properties of a `Coordinate` in a `Maze`.
/// - localizationKey: CoordinateDetails
public struct CoordinateDetails {
    /// The `Coordinate`'s type.
    /// - localizationKey: CoordinateDetails.type
    public let type: CoordinateType
    
    /// A flag to determine if the `Coordinate`'s has been marked as having been searched.
    /// - localizationKey: CoordinateDetails.isSearched
    internal(set) public var isSearched = false
    
    /// The `Coordinate` for the previous location in a computed path.
    /// Set by the running algorithm.
    /// - localizationKey: CoordinateDetails.previousCoordinate
    internal(set) var previousCoordinate: Coordinate = .invalid
    
    public init(type: CoordinateType) {
        self.type = type
    }
}

/// Used to define the type of `Coordinate` within a `Maze`.
/// - localizationKey: CoordinateType
public enum CoordinateType {
    case start, goal, floor, wall
}
