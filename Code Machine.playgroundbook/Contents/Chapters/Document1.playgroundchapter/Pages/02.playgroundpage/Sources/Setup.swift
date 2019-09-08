// 
//  Setup.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//
import UIKit

public func playgroundPrologue() {
    registerEvaluator(PageAssessment(), style: .discrete)
}


public func playgroundEpilogue() {
   performAssessment()
}
