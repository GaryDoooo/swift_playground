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
                if forgedItem.item == Thing.flowyRainbowRibbon || forgedItem.item == Thing.spiralingStalactites || forgedItem.item == Thing.octopusTentacle {
                    successMessage = String(format: NSLocalizedString("### You created: %1$@!\n\nYou’re learning quickly! Here are some quick tips for using colors to forge items:\n\n * **Red light**: Heats items. Good for making mechanical objects.\n\n * **Blue light**: Cools and transforms items. Good for making clothing.\n\n * **Green light**: Gives life. Good for making living things.\n\n[**Next Page**](@next)", comment: "Created the ribbon, stalactites, or tentacle."), forgedItem.item.name)
                    playSoundInLiveView(SoundFX.congrats)
                    return true
                }
            } else if case .pageExecutionCompleted = event {
                pageExecutionCompleted = true
            }
        }
        
        if pageExecutionCompleted {
            if Thing.flowyRainbowRibbon.hasBeenForged || Thing.spiralingStalactites.hasBeenForged || Thing.octopusTentacle.hasBeenForged {
                successMessage = NSLocalizedString("### You’re too quick! \n\nThe machine can barely keep up with your abilities. Seems that you’ve forged all that you need for now. Stick around to create more on this page, or move on to learn some advanced ways to use the machine. \n\n[**Next Page**](@next).", comment: "Already created ribbon, stalactites, or tentacle")
                playSoundInLiveView(SoundFX.congrats)

                return true
            }
            return false
        } else {
            return nil
        }
    }
}
