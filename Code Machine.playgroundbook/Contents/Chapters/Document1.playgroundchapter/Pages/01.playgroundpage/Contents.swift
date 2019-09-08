//#-hidden-code
//
//  Contents.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
You’ve discovered a mysterious, glowing machine. But wait—it looks like it’s missing some of its parts!
 
 Luckily, you can add items (inputs) into the machine, and it will [forge](glossary://forge) together new items (outputs). This process is similar to what devices do with code.
 
1. steps:  Run the code below to see how the machine behaves.
 2. In the code, tap `metal` or `cloth` to replace it with another item, such as `dirt`, `DNA`, or `stone`.
3. The machine could use a new set of eyes. Could you combine DNA with some other item to make a pair?
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
//#-code-completion(identifier, show, setItemA(_:), setItemB(_:), forgeItems())
//#-code-completion(identifier, show, metal, stone, cloth, dirt, DNA, .)
//#-code-completion(identifier, hide, listener, proxy)

//#-end-hidden-code
//#-editable-code Tap to enter code
setItemA(.metal)
setItemB(.cloth)
forgeItems()

//#-end-editable-code
//#-hidden-code
assessmentController?.append(.pageExecutionCompleted)
assessmentController?.shouldStopPageAfterDiscreteAssessment = true
playgroundEpilogue()
//#-end-hidden-code
