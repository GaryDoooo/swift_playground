//#-hidden-code
//
//  Contents.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 The machine is getting impatient! It needs you to create parts more quickly. Use a [loop](glossary://loop) to try many different combinations in a row.
 
An [array](glossary://array) stores a list of things of the same type. In the code below, the array contains **red**, **green**, and **blue** lights. A [`for` loop](glossary://for%20loop) then repeats the same block of code three times—once for each of the colors in the array.
 
 1. Steps: Try modifying the loop below to find a new part for the machine.
 2. Some say it’s effective to combine a seed and dirt in a certain light!
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
let colors = [Light.red, Light.green, Light.blue]

for color in colors {
    setItemA(.stone)
    setItemB(.dirt)
    switchLightOn(color)
    forgeItems()
}
//#-end-editable-code
//#-hidden-code
assessmentController?.append(.pageExecutionCompleted)
assessmentController?.shouldStopPageAfterDiscreteAssessment = true
playgroundEpilogue()
//#-end-hidden-code

