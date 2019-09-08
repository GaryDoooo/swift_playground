//
//  Array+extensions.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved. 
//

import Foundation
import GameplayKit

public extension Array {
    
    /// A randomly chosen index into the array.
    ///
    /// - localizationKey: Array.randomIndex
    var randomIndex: Int {
        return Int(arc4random_uniform(UInt32(self.count)))
    }
    
    /// A randomly chosen item from the array.
    ///
    /// - localizationKey: Array.randomItem
    var randomItem: Element {
        return self[self.randomIndex]
    }
    
    /// Shuffles the items of the array in place.
    ///
    /// - localizationKey: Array.shuffle()
    mutating func shuffle() {
        self = shuffled()
    }
    
    /// Returns a copy of the array with its items shuffled.
    ///
    /// - localizationKey: Array.shuffled()
    func shuffled() -> [Element] {
        return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: self) as! [Element]
    }
}
