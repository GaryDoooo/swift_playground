//#-hidden-code
//
//  Contents.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Goal:** Modify how your bricks are set up.
 
 Your first task is to set up the bricks that you’ll destroy.
 
 Below is a `setupBricks` function that’s passed the number of columns and rows to use to place bricks, which is 8 columns by 12 rows in this game.
 
 The function currently places bricks on every coordinate. You can adjust whether it places a brick depending on the row and column to make different patterns. You could try placing bricks on even-numbered rows only, or making a checkered pattern. You can also adjust the color of each brick.
 
 Try making your own designs and see what you prefer. When you’re ready, go on to the next page to start styling your bricks!
 */
//#-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(literal, show, color, array)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, playGame(), Brick, color, coordinate, neighbors, strength, (, (), place(_:at:), Coordinate, column:row:), (column:row:), column:row:, remove(_:), playSound(_:), brickAt(_:), Level, if, func, var, let, isEven, isOdd, randdomInt(from:to:), ., =, <=, >=, <, >, ==, !=, +, -, +=, -=, *=, true, false, &&, ||, !, *, /, Sound, beam, blip, crystal, drop, echobird, miss, pop, powerup, radiant, sonar, squeak, tick, wall, warp, zap, boop, beep)

import UIKit
import PlaygroundSupport

//#-end-hidden-code
//#-editable-code
func setupBricks(columnCount: Int, rowCount: Int) {
    for row in 0 ..< rowCount {
        for column in 0 ..< columnCount {
            // Try changing the brick placement to even-numbered rows only.
            let coord = Coordinate(column: column, row: row)
            
            let brick = Brick()
            brick.color = #colorLiteral(red: 0.968627451, green: 0.3215686275, blue: 0.3215686275, alpha: 1)
            
            place(brick, at: coord)
        }
    }
}

playGame()
//#-end-editable-code
//#-hidden-code
level.setupBricks = setupBricks

if _playGameCalled {
    let gameViewController = GameViewController.loadFromStoryboard()
    PlaygroundPage.current.liveView = gameViewController
    gameViewController.game = Game(levels: [level])
}

//#-end-hidden-code
