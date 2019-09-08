//#-hidden-code
//
//  Contents.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 Now that you know what the machine does, you’re ready to explore how to control it with code.
 
 Each command you send to the machine is known as a [function](glossary://function). A function tells the machine to do a specific thing. For instance, `forgeItems()` tells the machine to combine the two items you’ve set as inputs.
 
 Some functions, like `setItemA()`, take an [argument](glossary://argument) that customizes how it works. You can [pass](glossary://pass) in different arguments to change what the machine creates.
 
 * callout(Passing in an argument):
     `setItemA(.spring)`
 
 1. steps: Run the code to see what the machine creates.
 2. That spring seems useful! Try passing it into `setItemA()` as an argument.
 3. Try combining the spring with another item to make something useful for the machine.
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
//#-code-completion(identifier, show, let, setItemA(_:), setItemB(_:), forgeItems())
//#-code-completion(identifier, show, metal, stone, cloth, dirt, DNA, ., spring)
//#-code-completion(identifier, hide, listener, proxy)

//#-end-hidden-code
//#-editable-code Tap to enter code
setItemA(.metal)
setItemB(.dirt)
forgeItems()
//#-end-editable-code
//#-hidden-code
assessmentController?.append(.pageExecutionCompleted)
assessmentController?.shouldStopPageAfterDiscreteAssessment = true
playgroundEpilogue()
//#-end-hidden-code
