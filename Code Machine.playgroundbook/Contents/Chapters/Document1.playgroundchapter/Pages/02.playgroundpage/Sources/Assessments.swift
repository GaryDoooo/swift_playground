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
                if forgedItem.item == Thing.ostrichLegs || forgedItem.item == Thing.extendoHat {
                    successMessage = String(format: NSLocalizedString("### Woo-hoo! %1$@!\n\nYou [passed](glossary://pass) in %2$@ and %3$@. Can you think of a reason why the machine created what it did (%4$@)?\n\nPassing in [arguments](glossary://argument) lets you customize a function to do something different, depending on what you give it. That’s quite handy! \n\n[**Next Page**](@next)", comment: "Created one of the goal items"), forgedItem.item.name, String(describing: forgedItem.recipe.itemA), String(describing: forgedItem.recipe.itemB), forgedItem.item.name)
                    playSoundInLiveView(SoundFX.congrats)
                    return true
                }
            } else if case .pageExecutionCompleted = event {
                pageExecutionCompleted = true
            }
        }
        if pageExecutionCompleted {
            if Thing.ostrichLegs.hasBeenForged || Thing.extendoHat.hasBeenForged {
                successMessage = NSLocalizedString("### You’re ahead of the game!\n\n You’ve already forged the [final product](glossary://final%20product) you need here. You can move on or continue to experiment. Your choice! \n\n[**Next Page**](@next)", comment: "Already forged ostrich legs or extendo hat ")
                playSoundInLiveView(SoundFX.congrats)
                return true
            }
            return false
        } else {
            return nil
        }
    }
}
