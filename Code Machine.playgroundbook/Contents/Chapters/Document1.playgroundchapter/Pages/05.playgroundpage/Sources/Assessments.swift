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
        
        let possibleFinalProducts: [Thing] = [.mushroomHelmet, .mechanicalWig, .chromeShredderWheels, .blu, .friedEggs, .stoneMask, .eagleSunglasses, .diamondJacket, .dragonWings, .snapPeaTutu, .electricHoolahoop, .springLoadedFist, .turboFanBladePropeller, .flamingoBouquet, .meatballSleeve, .glowingMushroomShoes, .purplePressurePistons]
        for event in assessmentInfo.events {
            if case .forgedItem(let forgedItem) = event {
                if forgedItem.item.isFinalProduct && possibleFinalProducts.contains(forgedItem.item) {
                    successMessage = String(format: NSLocalizedString("### Huzzah! You created: %1$@!\n\n[Loops](glossary://loop) sure make things faster, don’t they? If you’re feeling adventurous, you could also try putting one loop inside another, a process known as [nesting](glossary://nest).\n\n[**Next Page**](@next)", comment: "Success for creating a new final product"), forgedItem.item.name)
                    playSoundInLiveView(SoundFX.congrats)

                    return true
                }
            } else if case .pageExecutionCompleted = event {
                pageExecutionCompleted = true
            }
        }
                
        if pageExecutionCompleted {
            return false
        } else {
            return nil
        }
    }
}
