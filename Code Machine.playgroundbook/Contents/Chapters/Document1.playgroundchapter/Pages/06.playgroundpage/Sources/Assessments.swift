// 
//  Assessments.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import UIKit
import PlaygroundSupport

/**
 A custom implementation of an Evaluator to determine the per-page messages,
 and the conditions which evaluate to a successful run.
 */
class PageAssessment: Evaluator {
    
    /// Custom per-page evaluation to determine pass/fail assessment.
    /// Return `true` to mark the page as successful.

    /// Custom success message
    var successMessage: String? = nil
    let completedChallengeMessage = NSLocalizedString("### Brilliant—the machine is complete!\n\nYou really did it—you used your coding skills to create missing parts for the machine. You should celebrate, you’ve done something incredible!\n\nNow you can try experimenting with the code to create the remaining parts for the machine. There are 24 in total. When you’re finished, check out [Learn to Code](x-playgrounds://document/?contentIdentifier=com.apple.playgrounds.learntocode1) to continue learning.\n\n[**Next Page**](@next)", comment: "Got 6 different final product categories")

    func evaluate(assessmentInfo: AssessmentInfo) -> Bool? {
        var pageExecutionCompleted = false
        
        let finalProductCategories: [String:[Thing]] = ["head" : [.mushroomHelmet, .extendoHat, .mechanicalWig, .blu], "face" : [.cyborgEyeballs, .friedEggs, .stoneMask, .eagleSunglasses],"appendage1" : [.octopusTentacle, .springLoadedFist, .pumpkinHand, .spiralingStalactites],"appendage2" : [.turboFanBladePropeller, .flamingoBouquet, .meatballSleeve, .flowyRainbowRibbon],"torso" : [.diamondJacket, .dragonWings, .snapPeaTutu, .electricHoolahoop],"feet" : [.glowingMushroomShoes, .chromeShredderWheels, .ostrichLegs, .purplePressurePistons]]
        
        
        for event in assessmentInfo.events {
            var productsCreated = 0
            
            if case .forgedItem(let forgedItem) = event {
                productsCreated = 0
                
                for (_, values) in finalProductCategories {
                    for value in values {
                        if value.hasBeenForged {
                            productsCreated += 1
                        }
                    }
                }
                
                if Robot.isFullyEquipped {
                    successMessage = completedChallengeMessage
                    return true
                } else if productsCreated == 24 {
                    successMessage = NSLocalizedString("### What!? Is it possible?\n\nYou created all 24 final products! You’re truly a forging master. The machine is forever in your debt for the phenomenal code you’ve written.\n\nWhenever you’re ready, try out some other [challenges](playgrounds://featured) or even [Learn to Code](x-playgrounds://document/?contentIdentifier=com.apple.playgrounds.learntocode1).\n\n[**Next Page**](@next)", comment: "Forged all 24 final products")
                    playSoundInLiveView(Sound.vocalCongrats)
                    return true
                }
            } else if case .pageExecutionCompleted = event {
                pageExecutionCompleted = true
            }
        }
        
        if pageExecutionCompleted {
            if Robot.isFullyEquipped {
                successMessage = completedChallengeMessage
                playSoundInLiveView(Sound.vocalCongrats)
                return true
            }
            return false
        } else {
            return nil
        }
    }
}
