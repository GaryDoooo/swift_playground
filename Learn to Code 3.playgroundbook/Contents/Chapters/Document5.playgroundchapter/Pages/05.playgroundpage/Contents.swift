//#-hidden-code
//
//  Contents.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//
//#-end-hidden-code
/*:#localized(key: "FirstProseBlock")
 **Create:** Build something amazing—you decide!
 
 Bring your creative and coding skills together to come up with a cool new idea. Code it right here, and surprise yourself and your friends.
 
 When you’re finished with your creation, [continue your coding journey](playgrounds://featured).
 */
//#-hidden-code
//#-code-completion(currentmodule, show)

import UIKit

public typealias _ImageLiteralType = Image

playgroundPrologue()
//#-end-hidden-code
//#-editable-code
scene.clear()
// Use your own background image.
scene.backgroundImage = #imageLiteral(resourceName: "SpaceThePurpleFrontier@2x.png")
// Add your own code to set up the scene.

func doSomething(touch: Touch) {

}

func doSomethingTo(graphic: Graphic) {

}

func buttonTapped() {

}

// Change the tools or add new tools.
let toolA = Tool(name: "Tool A", emojiIcon: "🅰️")
toolA.onFingerMoved = doSomething(touch:)
scene.tools.append(toolA)

let toolB = Tool(name: "Tool B", emojiIcon: "🅱️")
toolB.onGraphicTouched = doSomethingTo(graphic:)
scene.tools.append(toolB)

// Change the button name.
let button = Button(name: "Button")
button.onTap = buttonTapped
scene.button = button
//#-end-editable-code

//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code
