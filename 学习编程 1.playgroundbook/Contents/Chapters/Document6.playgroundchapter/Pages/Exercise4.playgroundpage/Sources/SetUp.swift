// 
//  SetUp.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
import Foundation

// MARK: Globals
let world: GridWorld = loadGridWorld(named: "7.7")
let actor = Actor()

public func playgroundPrologue() {
    
    placeActor()
    placeItems()
    

    // Must be called in `playgroundPrologue()` to update with the current page contents.
    registerAssessment(world, assessment: assessmentPoint)
    
    //// ----
    // Any items added or removed after this call will be animated.
    finalizeWorldBuilding(for: world)
    //// ----
}

// Called from LiveView.swift to initially set the LiveView.
public func presentWorld() {
    setUpLiveViewWith(world)
    
}

// MARK: Epilogue

public func playgroundEpilogue() {
    sendCommands(for: world)
}

func placeActor() {
    world.place(actor, facing: east, at: Coordinate(column: 0, row: 0))
}

func placeItems() {
    let items = [
                    Coordinate(column: 1, row: 2),
                    Coordinate(column: 1, row: 5),
                    Coordinate(column: 2, row: 3),
                    Coordinate(column: 2, row: 4),
                    Coordinate(column: 3, row: 4),
                    Coordinate(column: 3, row: 2),
                    Coordinate(column: 5, row: 5),
                    Coordinate(column: 5, row: 0),
                    ]
    world.placeGems(at: items)
}
