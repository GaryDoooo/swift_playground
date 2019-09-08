// 
//  SetUp.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
import Foundation

// MARK: Globals
public let world = loadGridWorld(named: "13.2")
let actor = Actor()

public func playgroundPrologue() {
    Display.coordinateMarkers = true
    placeItems()
    placeAdditionalItems()

    // Must be called in `playgroundPrologue()` to update with the current page contents.
    registerAssessment(world, assessment: assessmentPoint)
    
    //// ----
    // Any items added or removed after this call will be animated.
    finalizeWorldBuilding(for: world)
    //// ----
}

public func presentWorld() {
    setUpLiveViewWith(world)
}

// MARK: Epilogue

public func playgroundEpilogue() {
    sendCommands(for: world)
}

// MARK: Placement

func placeItems() {
    let dzCoords = [
                       Coordinate(column: 1, row: 7),
                       Coordinate(column: 2, row: 6),
                       Coordinate(column: 1, row: 1),
                       Coordinate(column: 2, row: 2),
                       Coordinate(column: 5, row: 4),
                       Coordinate(column: 6, row: 3),
                       ]
    world.place(nodeOfType: Switch.self, at: dzCoords)
    
    let itemCoords = [
                         Coordinate(column: 1, row: 6),
                         Coordinate(column: 2, row: 1),
                         Coordinate(column: 6, row: 4),
                         ]
    world.placeGems(at: itemCoords)
    
}

func placeAdditionalItems() {
    world.place(Block(), at: Coordinate(column: 1, row: 1))
    world.place(Block(), at: Coordinate(column: 2, row: 2))
    world.place(Block(), at: Coordinate(column: 6, row: 3))
    world.place(Block(), at: Coordinate(column: 6, row: 4))


}


