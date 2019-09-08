// 
//  SetUp.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
import Foundation

// MARK: Globals
public let world = loadGridWorld(named: "13.3")
var gemRandomizer: RandomizedQueueObserver?
public var greenPortal = Portal(color: .green)
public var bluePortal = Portal(color: .blue)
public var yellowPortal = Portal(color: .yellow)

public let randomNumberOfGems = Int(arc4random_uniform(6)) + 1
public var gemsPlaced = 0

let gemCoords = [
    Coordinate(column: 0, row: 1),
    Coordinate(column: 3, row: 0),
    Coordinate(column: 4, row: 3),
    Coordinate(column: 4, row: 0),
    Coordinate(column: 7, row: 2),
]

public func playgroundPrologue() {
    world.successCriteria = .count(collectedGems: randomNumberOfGems, openSwitches: 0)
    
    Display.coordinateMarkers = true
    placePortals()
    placeRandomPlaceholders()

    // Must be called in `playgroundPrologue()` to update with the current page contents.
    registerAssessment(world, assessment: assessmentPoint)

    //// ----
    // Any items added or removed after this call will be animated.
    finalizeWorldBuilding(for: world) {
        realizeRandomGems()
    }
    //// ----

    placeGemsOverTime()
}

// Called from LiveView.swift to initially set the LiveView.
public func presentWorld() {
    setUpLiveViewWith(world)
    
}

// MARK: Epilogue

public func playgroundEpilogue() {
    sendCommands(for: world)
}

// MARK: Placement

func placePortals() {
    world.place(bluePortal, between: Coordinate(column: 0, row: 3), and: Coordinate(column: 5, row: 3))
    world.place(greenPortal, between: Coordinate(column: 0, row: 0), and: Coordinate(column: 5, row: 0))
    world.place(yellowPortal, between: Coordinate(column: 2, row: 0), and: Coordinate(column: 7, row: 0))
}

func placeRandomPlaceholders() {
    let gem = Gem()
    for coordinate in gemCoords {
        world.place(RandomNode(resembling: gem), at: coordinate)
    }
}

func realizeRandomGems() {
    for coordinate in gemCoords where gemsPlaced < randomNumberOfGems {
        let random = Int(arc4random_uniform(5))
        if random % 2 == 0 {
            world.place(Gem(), at: coordinate)
            gemsPlaced += 1
        }
    }
    
}

func placeGemsOverTime() {

    gemRandomizer = RandomizedQueueObserver(randomRange: 0...5, world: world) { world in
        let existingGemCount = world.existingGems(at: gemCoords).count
        guard existingGemCount < 3 && gemsPlaced < randomNumberOfGems else { return }

        
        
        for coordinate in Set(gemCoords) {
            if world.existingGems(at: [coordinate]).isEmpty && world.existingCharacters(at: [coordinate]).isEmpty {
                world.place(Gem(), at: coordinate)
                gemsPlaced += 1
                
                return
                
            }
        }
    }

}


