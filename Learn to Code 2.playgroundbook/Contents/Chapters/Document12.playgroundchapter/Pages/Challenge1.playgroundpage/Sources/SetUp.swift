// 
//  SetUp.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
import Foundation

// MARK: Globals
public let world = loadGridWorld(named: "13.1")
let actor = Actor()

public func playgroundPrologue() {
    Display.coordinateMarkers = true
    placeItems()
    placeActor()
    world.placeBlocks(at: world.coordinates(inColumns: [2,4,6], intersectingRows: [2]))

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

func placeActor() {
    world.place(actor, facing: east, at: Coordinate(column: 0, row: 4))
}
    
func placeItems() {
    let _ = world.place(nodeOfType: Switch.self, at: world.coordinates(inColumns: [2,4,6], intersectingRows: [4]))
    world.placeGems(at: world.coordinates(inColumns: [2,4,6], intersectingRows: [0]))
}
