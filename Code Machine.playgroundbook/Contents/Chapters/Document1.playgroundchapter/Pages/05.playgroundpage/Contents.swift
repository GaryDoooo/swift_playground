//#-hidden-code
//
//  Contents.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
You can use a loop to try many different item combinations very quickly. To do this, use an [array](glossary://array) of items.
 
 * callout(An array of items):
     `let items = [Item.spring, Item.egg, Item.crystal, Item.gear]`
 
 The [`for` loop](glossary://for%20loop) below runs four times—once for each item in the `items` array. Each time the loop runs, the next item in the array is [passed](glossary://pass) into `setItemA()`, combining it with item B to create an output.
 
 1. Steps: Run the loop. Notice which items go into the machine each time it runs.
 2. Experiment with the loop by changing the [arguments](glossary://argument) for `switchLightOn()` and `setItemB()`.
 */
//#-hidden-code
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
let proxy = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy
let listener = LiveViewListener(for: proxy)
playgroundPrologue()
assessmentController?.shouldStopPageAfterDiscreteAssessment = false

//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, let, for, setItemA(_:), setItemB(_:), forgeItems(), switchLightOn(_:), [])
//#-code-completion(identifier, show, metal, stone, cloth, dirt, DNA, red, green, blue, ., spring, wire, gear, egg, seed, tree, crystal)
//#-code-completion(identifier, hide, listener, proxy)

//#-end-hidden-code
//#-editable-code Tap to enter code
let items = [Item.metal, Item.stone, Item.cloth, Item.DNA]

for item in items {
    setItemA(item)
    setItemB(.spring)
    switchLightOn(.blue)
    forgeItems()
}
//#-end-editable-code
//#-hidden-code
assessmentController?.append(.pageExecutionCompleted)
assessmentController?.shouldStopPageAfterDiscreteAssessment = true
playgroundEpilogue()
//#-end-hidden-code

