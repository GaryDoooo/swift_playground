// 
//  SetUp.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
import Foundation

// MARK: Globals
public let world = GridWorld(columns: 7, rows: 7)

public func playgroundPrologue() {
    Display.coordinateMarkers = true
   
    world.successCriteria = .custom(.ignoreGoals, world.charactersDidBoogie)

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

