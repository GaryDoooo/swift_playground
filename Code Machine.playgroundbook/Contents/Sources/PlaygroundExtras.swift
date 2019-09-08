//
//  PlaygroundExtras.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation

public enum Process {
    private(set) static var isLiveViewProcess = false
    fileprivate(set) static var isLiveViewConnectionOpen = false
    
    public static func configure() {
        isLiveViewProcess = true
    }
}

// MARK: Logging

private var logCounter = 0

public func PBLog(message: String = "", source: String = #file, caller: String = #function) {
    let processId = Process.isLiveViewProcess ? "LVP" : "UP"
    
    let fileName = URL(string: source)?.lastPathComponent ?? ""
    
    let prefixedString = "PBLog: <#\(logCounter): \(processId)>-\(fileName)-\(caller) " + message
    NSLog(prefixedString)
    
    logCounter += 1
}
