//#-hidden-code
//
//  LiveView.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//
//#-end-hidden-code

import PlaygroundSupport
import UIKit

Process.configure()
PlaygroundPage.current.liveView = FoundryViewController.makeFromStoryboard()
