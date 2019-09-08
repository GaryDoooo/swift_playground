// 
//  SetUp.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
import Foundation

// MARK: Globals
let world = loadGridWorld(named: "8.2")
public let actor = Actor()

public func playgroundPrologue() {
    
    placeItems()
    placeRandomPlaceholderElements()
    
    world.place(actor, facing: north, at: Coordinate(column: 0, row: 0))

    // Must be called in `playgroundPrologue()` to update with the current page contents.
    registerAssessment(world, assessment: assessmentPoint)
    
    //// ----
    // Any items added or removed after this call will be animated.
    finalizeWorldBuilding(for: world) {
        realizeRandomElements()
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

func placeRandomPlaceholderElements() {
    let block = Block()
    for i in 1..<4 {
        world.place(RandomNode(resembling: block), at: Coordinate(column: 2, row: i))
    }
    
    let random2 = 3
    let rect3 = world.coordinates(inColumns: Set((5-random2)...5), intersectingRows: ([5]))
    for coord in rect3 {
        world.place(RandomNode(resembling: block), at: coord)
    }
    
    for i in 1..<5 {
        world.place(RandomNode(resembling: block), at: Coordinate(column: 7, row: i))
    }
}

func realizeRandomElements() {
    let random1 = Int(arc4random_uniform(3)) + 1
    world.place(Block(), at: Coordinate(column: 2, row: random1))
    
    let random2 = Int(arc4random_uniform(3)) + 1
    let rect3 = world.coordinates(inColumns: Set((5-random2)...5), intersectingRows: ([5]))
    world.placeBlocks(at: rect3)
    
    let random3 = Int(arc4random_uniform(2)) + 1
    world.place(Block(), at: Coordinate(column: 7, row: random3))
    world.place(Block(), at: Coordinate(column: 7, row: random3 + 2))
    world.place(Block(), at: Coordinate(column: 7, row: random3 + 3))
}

func placeItems() {
    let items = [
                    Coordinate(column: 2, row: 0),
                    Coordinate(column: 5, row: 0),
                    
                    ]
    world.placeGems(at: items)
    
    world.place(Switch(), at: Coordinate(column: 9, row: 0))
}
