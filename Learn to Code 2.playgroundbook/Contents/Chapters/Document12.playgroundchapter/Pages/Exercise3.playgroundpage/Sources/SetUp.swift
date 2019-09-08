// 
//  SetUp.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
import Foundation

// MARK: Globals
public let world = loadGridWorld(named: "13.7")
let actor = Actor()

public func playgroundPrologue() {
    Display.coordinateMarkers = true
    placeItems()

    world.place(actor, facing: north, at: Coordinate(column: 3, row: 0))

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
    world.place(nodeOfType: Switch.self, at: world.coordinates(inColumns: [0,6], intersectingRows: [4,5,6]))
    world.place(nodeOfType: Switch.self, at: world.coordinates(inColumns: [2,3,4], intersectingRows: [8]))
}
