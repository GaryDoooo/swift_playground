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
        for event in assessmentInfo.events {
            if case .forgedItem(let forgedItem) = event {
                if forgedItem.item == Thing.cyborgEyeballs {
                    successMessage = String(format: NSLocalizedString("## Whoa—you created cyborg eyeballs!\n\nYou [forged](glossary://forge) together %1$@ and %2$@, bringing the metal to life with the power of genetic material. Seems a bit silly, but maybe this machine has its own set rules that you can try to figure out.\n\n[**Next Page**](@next)", comment: "Success for forging cyborg eyeballs"), String(describing: forgedItem.recipe.itemA), String(describing: forgedItem.recipe.itemB))
                    playSoundInLiveView(SoundFX.congrats)
                    return true
                } else if forgedItem.item.isFinalProduct {
                    let thingName: String = forgedItem.item.name
                    let forTheFirstTime = forgedItem.isForgedFirstTime ? NSLocalizedString(" for the first time", comment: "") : ""
                    successMessage = String(format: NSLocalizedString("### Phenomenal job!\n\n You created %1$@%2$@! You must be pretty good at using the machine. You can keep trying to create final products, or you can move on and learn more about the machine and its mysterious ways. \n\n[**Next Page**](@next)", comment: "Forged something other than cyborg eyeballs"), thingName, forTheFirstTime)
                    return true
                }
            }
        }
        return false
        
    }
}
