// 
//  Assessments.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import PlaygroundSupport
import Foundation
import CoreGraphics

/**
 A custom implementation of an Evaluator to determine the per-page messages,
 and the conditions which evaluate to a successful run.
 */
class PageAssessment: Evaluator {

    func extractedNumericValue(from string: String) -> Float? {
        let numericCharacterSet = "0123456789."
        let filteredCharacters = string.characters.filter {
            return numericCharacterSet.contains(String($0))
        }
        return Float(String(filteredCharacters))
    }
    
    /// Custom per-page evaluation to determine pass/fail assessment.
    /// Return `true` to mark the page as successful.
    func evaluate(assessmentInfo: AssessmentInfo) -> Bool? {
        guard assessmentInfo.events.count >= 2 else { return nil }
        
        let checker = ContentsChecker(contents: PlaygroundPage.current.text)
        
        let conditionalStatements = checker.conditionalNodes.map { $0.condition }
        
        for statement in conditionalStatements where statement.contains("<") {
            
            if let expression = statement.components(separatedBy: "<").last {
                if let distance = extractedNumericValue(from: expression), distance > 10.0 {
                    return true
                }
            }
        }
        
        return false
    }
}
