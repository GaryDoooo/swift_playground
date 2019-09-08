// 
//  Setup.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
import Foundation

// MARK: Globals
let world: GridWorld = loadGridWorld(named: "3.3")
let actor = Actor()

public func playgroundPrologue() {
    
    placeItems()
    placeActor()
    

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
    world.place(actor, facing: north, at: Coordinate(column: 3, row: 3))
}

func placeItems() {
    let items = [
                    Coordinate(column: 1, row: 3),
                    Coordinate(column: 5, row: 3),
                    
                    Coordinate(column: 3, row: 1),
                    Coordinate(column: 3, row: 5),
                    
                    
                    ]
    world.place(nodeOfType: Switch.self, at: items)
    
    
    let switches = [
                       Coordinate(column: 5, row: 5),
                       Coordinate(column: 1, row: 1),
                       Coordinate(column: 5, row: 1),
                       Coordinate(column: 1, row: 5),
                       
                       ]
    
    let switchNodes = world.place(nodeOfType: Switch.self, at: switches)
    
    for switchNode in switchNodes {
        
        switchNode.isOn = true
        
    }
}
