//
//  Int+OddEven.swift
//
//  Copyright © 2016-2018 Apple Inc. All rights reserved.
//

import Foundation

public extension Int {
    /// Returns ``true`` if the Int is odd.
    /// - localizationKey: Int.isOdd
    public var isOdd: Bool {
        return (self % 2) == 1
    }
    /// Returns ``true`` if the Int is even.
    /// - localizationKey: Int.isEven
    public var isEven: Bool {
        return !isOdd
    }
}
