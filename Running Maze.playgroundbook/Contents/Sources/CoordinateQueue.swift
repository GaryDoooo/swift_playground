//
//  CoordinateQueue.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import Foundation

/// A first in, first out collection of `Coordinates`.
/// - localizationKey: CoordinateQueue
public struct CoordinateQueue {
    
    fileprivate var coordinates = [Coordinate]()
    
    /// Intializes a new `CoordinateQueue`.
    /// - localizationKey: CoordinateQueue()
    public init() {
        // This initializer needs to be explicitiy defined to allow autocomplete in the Swift Playgrounds app to detect it.
    }
    
    /// A Boolean value indicating whether the queue is empty.
    /// - localizationKey: CoordinateQueue.isEmpty
    public var isEmpty: Bool {
        return coordinates.isEmpty
    }
    
    /// The number of `Coordinates` in the queue.
    /// - localizationKey: CoordinateQueue.count
    public var count: Int {
        return coordinates.count
    }
    
    /// An array of all the `Coordinates` in the queue.
    /// - localizationKey: CoordinateQueue.allCoordinates
    public var allCoordinates: [Coordinate] {
        return coordinates
    }
    
    /// Adds a `Coordinate` to the end of the queue.
    /// - localizationKey: CoordinateQueue.add(_{Coordinate}:)
    public mutating func add(_ coordinate: Coordinate) {
        if !coordinates.contains(coordinate) {
            coordinates.append(coordinate)
        }
    }
    
    /// Adds an array of `Coordinate`s to the end of the queue.
    /// - localizationKey: CoordinateQueue.add(_{[Coordinate]}:)
    public mutating func add(_ coordinates: [Coordinate]) {
        for coordinate in coordinates {
            add(coordinate)
        }
    }
    
    /// Removes a `Coordinate` from the queue.
    /// - localizationKey: CoordinateQueue.remove(_:)
    public mutating func remove(_ coordinate: Coordinate) {
        if let index = coordinates.index(of: coordinate) {
            coordinates.remove(at: index)
        }
    }
    
    /// Returns the `Coordinate` at the given index in the queue.
    /// - localizationKey: CoordinateQueue.coordinate(at:)
    public func coordinate(at index: Int) -> Coordinate {
        return coordinates[index]
    }
    
    /// Returns the `Coordinate` at the given index in the queue.
    /// - localizationKey: CoordinateQueue.subscript(index:)
    public subscript(index: Int) -> Coordinate {
        return coordinates[index]
    }

    /// Returns the first `Coordinate` in the queue and removes it.
    /// - localizationKey: CoordinateQueue.popFirstCoordinate()
    public mutating func popFirstCoordinate() -> Coordinate {
        guard let coordinate = coordinates.first else {
            fatalError(NSLocalizedString("The CoordinateQueue is empty.", comment: "Error shown when trying to pop a coordinate from an empty queue."))
        }
        
        coordinates.removeFirst()
        return coordinate
    }
}

/// Extends `CoordinateQueue` to conform to the `Sequence` protocol.
/// Allows a `CoordinateQueue` to be used in a for-in statement.
extension CoordinateQueue: Sequence {
    public func makeIterator() -> Array<Coordinate>.Iterator {
        return coordinates.makeIterator()
    }
}
