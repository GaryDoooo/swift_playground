// 
//  Assessments.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import UIKit

/**
 A custom implementation of an Evaluator to determine the per-page messages,
 and the conditions which evaluate to a successful run.
 */
class PageAssessment: Evaluator {
    
    /// Custom per-page evaluation to determine pass/fail assessment.
    /// Return `true` to mark the page as successful.

    /// Custom success message
    var successMessage: String? = nil
    

    func evaluate(assessmentInfo: AssessmentInfo) -> Bool? {
        var pageExecutionCompleted = false
        
        for event in assessmentInfo.events {
            if case .forgedItem(let forgedItem) = event {
                if forgedItem.item == Thing.pumpkinHand {
                    successMessage = String(format: NSLocalizedString("### Gadzooks! You forged: %1$@!\n\nStoring colors in an [array](glossary://array) allows you to loop through the options far faster than trying each one individually.\n\nNotice that when you combined seed and dirt with the green light on, it created the pumpkin hand. Green lights are great at producing living items in the machine.\n\n[**Next Page**](@next)", comment: "Success for creating pumpkin hand"), forgedItem.item.name)
                    playSoundInLiveView(SoundFX.congrats)

                    return true
                }
            } else if case .pageExecutionCompleted = event {
                pageExecutionCompleted = true
            }
        }
        
        if pageExecutionCompleted {
            if Thing.pumpkinHand.hasBeenForged {
                successMessage = NSLocalizedString("### We’re dealing with an expert here!\n\nYou’ve already managed to create what you needed here—the pumpkin hand. It’s time to move on and help the machine become complete.\n\n[**Next Page**](@next)", comment: "Already created pumpkin")
                playSoundInLiveView(SoundFX.congrats)

                return true
            }
            return false // Show Hints only at the end after the final item has been forged.
        } else {
            return nil  // Don't show anything.
        }
    }
}
