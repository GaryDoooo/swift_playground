//#-hidden-code
//
//  Contents.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
You’ve come a long way, coder! Now it’s time for you to complete the machine.
 
1. Steps: Attach one part to each of the machine’s six attachment points to make it whole again.
2. Experiment with the code to make new parts. Use the skills you’ve learned, or try something completely new. Good luck out there!
*/
//#-hidden-code
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
let proxy = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy
let listener = LiveViewListener(for: proxy)
playgroundPrologue()
assessmentController?.shouldStopPageAfterDiscreteAssessment = false

var shouldEnableAutoPlayCelebrationDance = true
if let currentStatus = PlaygroundPage.current.assessmentStatus, case .pass = currentStatus {
    shouldEnableAutoPlayCelebrationDance = false
}
proxy?.send(PlaygroundMessageToLiveView.enableAutoPlayCelebrationDance(enabled: shouldEnableAutoPlayCelebrationDance).playgroundValue)

//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, let, for, setItemA(_:), setItemB(_:), forgeItems(), switchLightOn(_:), [])
//#-code-completion(identifier, show, metal, stone, cloth, dirt, DNA, red, green, blue, ., Light, Item, spring, gear, egg, seed, tree, crystal, wire, mushroom, unidentifiedLifeForm)
//#-code-completion(identifier, hide, listener, proxy, shouldEnableAutoPlayCelebrationDance)

//#-end-hidden-code
//#-editable-code Tap to enter code
let items = [Item.metal, Item.cloth, Item.DNA]

for item in items {
    setItemA(.mushroom)
    setItemB(item)
    switchLightOn(.blue)
    forgeItems()
}
//#-end-editable-code
//#-hidden-code
assessmentController?.append(.pageExecutionCompleted)
assessmentController?.shouldStopPageAfterDiscreteAssessment = true
playgroundEpilogue()
//#-end-hidden-code


