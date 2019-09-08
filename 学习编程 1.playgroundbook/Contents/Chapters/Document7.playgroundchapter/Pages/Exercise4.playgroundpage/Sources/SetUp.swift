// 
//  SetUp.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
import Foundation

// MARK: Globals
let world = loadGridWorld(named: "8.4")
public let actor = Actor()

public func playgroundPrologue() {
    
    placeItems()
    
    world.place(actor, facing: west, at: Coordinate(column: 8, row: 5))
    

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

func placeItems() {
    let items = [
                    Coordinate(column: 5, row: 0),
                    ]
    world.placeGems(at: items)
    
    let dzs = [
                  Coordinate(column: 0, row: 0),
                  Coordinate(column: 0, row: 3),
                  Coordinate(column: 2, row: 3),
                  Coordinate(column: 2, row: 7),
                  Coordinate(column: 6, row: 7),
                  Coordinate(column: 6, row: 5),
                  ]
    world.place(nodeOfType: Switch.self, at: dzs)
}
