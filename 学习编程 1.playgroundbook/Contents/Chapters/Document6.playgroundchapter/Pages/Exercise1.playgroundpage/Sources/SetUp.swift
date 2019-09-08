// 
//  SetUp.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
import Foundation

// MARK: Globals
let world: GridWorld = loadGridWorld(named: "7.1")
public let actor = Actor()

public func playgroundPrologue() {
    
    placeActor()
    placeRandomItems()

    // Must be called in `playgroundPrologue()` to update with the current page contents.
    registerAssessment(world, assessment: assessmentPoint)
    
    //// ----
    // Any items added or removed after this call will be animated.
    finalizeWorldBuilding(for: world) {
        realizeRandomItems()
    }
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

func placeRandomItems() {
    let switchItem = Switch()
    for i in 0..<9 {
        world.place(RandomNode(resembling: switchItem), at: Coordinate(column: i, row: 1))
    }
}

func realizeRandomItems() {
    let randomLength = Int(arc4random_uniform(5)) + 3
    
    for i in 0...randomLength {
        world.place(nodeOfType: Switch.self, at: [Coordinate(column: i, row: 1)])
    }
    
    let switchNodes = world.place(nodeOfType: Switch.self, at: [Coordinate(column: (randomLength + 1), row: 1)])
    
    for switchNode in switchNodes {
        switchNode.isOn = true
    }
}

func placeActor() {
    world.place(actor, facing: east, at: Coordinate(column: 0, row: 1))
    world.placeStartMarkerUnderActor = false
}
