// 
//  Assessments.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import Foundation

let success = NSLocalizedString("### Incredible work! \nYou found all the bugs in the code! \n\n[**Next Page**](@next)", comment:"Success message")

let solution: String? = nil

import PlaygroundSupport
public func assessmentPoint() -> AssessmentResults {
    let checker = ContentsChecker(contents: PlaygroundPage.current.text)
    
    var hints = [
        NSLocalizedString("Sometimes a bug is just one out-of-place command. Think about which commands, in which order, will get you to the switch and the gem. Can you move one or more commands to make that happen?", comment:"Hint"),
        NSLocalizedString("Imagine moving step by step through the puzzle world. Compare those moves to the existing commands to see what’s gone wrong.", comment:"Hint"),
        NSLocalizedString("This puzzle is a **challenge** and has no provided solution. Strengthen your coding skills by creating your own approach to solving it.", comment:"Hint")

    ]
    
    let defaultContents = [
        "moveForward",
        "moveForward",
        "moveForward",
        "turnLeft",
        "toggleSwitch",
        "moveForward",
        "moveForward",
        "moveForward",
        "collectGem",
        "moveForward"
    ]
    
    if checker.calledFunctions == defaultContents {
        hints[0] = NSLocalizedString("Byte toggled an **open** switch **closed**. This is a bug! Figure out how to rearrange the existing commands to toggle all switches open and collect the gem.", comment:"Hint")
    } else if checker.numberOfStatements > 10 {
        hints[0] = NSLocalizedString("Adding more commands might not help here. Try rearranging your existing code by tapping a command to select it, then dragging it to a new location.", comment:"Hint")
        
    } else if checker.numberOfStatements > 12 {
        hints[0] = NSLocalizedString("If you’d like to start over, tap the three dots at the top right, then select \"Reset Page...\"", comment:"Hint")
    }
    
    

    return updateAssessment(successMessage: success, failureHints: hints, solution: solution)
}






