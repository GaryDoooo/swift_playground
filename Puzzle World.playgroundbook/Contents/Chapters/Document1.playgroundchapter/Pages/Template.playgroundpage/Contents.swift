//#-hidden-code
//
//  Contents.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

playgroundPrologue()
typealias Character = Actor
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(literal, show, color, array)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, isOnOpenSwitch, if, func, for, while, moveForward(), turnLeft(), turnRight(), collectGem(), toggleSwitch(), isBlocked, north, south, east, west, Water, Expert, Character, (, ), (), turnLockUp(), turnLockDown(), isOnClosedSwitch, var, let, ., =, <, >, ==, !=, +=, +, -, isBlocked, move(distance:), Character, Expert, (, ), (), Portal, color:, (color:), Block, Gem, Stair, Switch, Platform, (onLevel:controlledBy:), onLevel:controlledBy:, PlatformLock, jump(), true, false, turnLock(up:numberOfTimes:), world, place(_:facing:at:), place(_:between:and:), removeBlock(atColumn:row:), isBlockedLeft, &&, ||, !, isBlockedRight, Coordinate, column:row:), (column:row:), column:row:, place(_:at:), remove(at:), insert(_:at:), removeItems(at:), append(_:), count, column(_:), row(_:), removeFirst(), removeLast(), randomInt(from:to:), removeAll(), allPossibleCoordinates, danceLikeNoOneIsWatching(), turnUp(), breakItDown(), grumbleGrumble(), argh(), coordinates(inRows:), coordinates(inColumns:intersectingRows:), name:, (name:), byte, blu, hopper, randomBool(), height(at:), movePlatforms(up:numberOfTimes:), height(at:), coordinates(inColumns:), existingGems(at:), existingSwitches(at:), existingCharacters(at:), existingExperts(at:), existingBlocks(at:), existingWater(at:), placeBlocks(at:), placeWater(at:), placeGems(at:), CharacterName, numberOfBlocks(at:), column, row)
//#-editable-code Tap to enter code
let hopper = Character(name: .hopper)
world.place(hopper, at: Coordinate(column: 1, row: 1))
//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code
