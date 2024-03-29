// 
//  Assessments.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import CoreGraphics

/**
 A custom implementation of an Evaluator to determine the per-page messages,
 and the conditions which evaluate to a successful run.
 */
class PageAssessment: Evaluator {
    
    /// Custom per-page evaluation to determine pass/fail assessment.
    /// Return `true` to mark the page as successful.
    func evaluate(assessmentInfo: AssessmentInfo) -> Bool? {
        if assessmentInfo.context != .button { return nil }

        var removedGraphics: [Graphic] = []
        for event in assessmentInfo.events {
            if case .moveAndRemove(let graphic, _) = event {
                removedGraphics.append(graphic)
            }
        }
        if removedGraphics.count > 5 {
            return true 
        }
        
        return nil
    }
}
