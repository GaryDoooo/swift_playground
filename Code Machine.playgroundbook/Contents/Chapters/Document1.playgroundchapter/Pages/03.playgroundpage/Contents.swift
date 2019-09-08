//#-hidden-code
//
//  Contents.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 The machine has three shiny buttons colored **red**, **green**, and **blue**. To switch one on, use the `switchLightOn()` [function](glossary://function) and pass in an [argument](glossary://argument) for the color you’d like to switch on.
 
 - callout(Example):
     `switchLightOn(.red)`
 
 1. Steps: Run the code below to create a crystal.
 2. Try combining crystal with another item to make something colorful.
 3. [Pass](glossary://pass) in a different color to `switchLightOn()`. There’s a rumor that crystals respond well to blue light!
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
//#-code-completion(identifier, show, let, setItemA(_:), setItemB(_:), forgeItems(), switchLightOn(_:))
//#-code-completion(identifier, show, metal, stone, cloth, dirt, DNA, red, green, blue, ., crystal, spring, gear)
//#-code-completion(identifier, hide, listener, proxy)

//#-end-hidden-code
//#-editable-code Tap to enter code
setItemA(.stone)
setItemB(.stone)
switchLightOn(.red)
forgeItems()

//#-end-editable-code
//#-hidden-code
assessmentController?.append(.pageExecutionCompleted)
assessmentController?.shouldStopPageAfterDiscreteAssessment = true
playgroundEpilogue()
//#-end-hidden-code
