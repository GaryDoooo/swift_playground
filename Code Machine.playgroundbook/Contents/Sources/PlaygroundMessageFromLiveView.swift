//
//  PlaygroundMessageFromLiveView.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved. 
//

import Foundation

/// An enumeration of messages that can be sent from the live view.
public enum PlaygroundMessageFromLiveView: PlaygroundMessage {
    case itemForged(item: ForgedItem)
    case celebrationDanceCompleted
    
    public enum MessageType: String, PlaygroundMessageType {
        case itemForged
        case celebrationDanceCompleted
    }
    
    public var messageType: MessageType {
        switch self {
        case .itemForged(item:):
            return .itemForged
        case .celebrationDanceCompleted:
            return .celebrationDanceCompleted
        }
    }
    
    public init?(messageType: MessageType, encodedPayload: Data?) {
        let decoder = JSONDecoder()
        
        switch messageType {
        case .itemForged:
            guard let payload = encodedPayload,
                  let object = try? decoder.decode(ForgedItemPayload.self, from: payload) else { return nil }
            self = .itemForged(item: object.forgedItem)
        case .celebrationDanceCompleted:
            self = .celebrationDanceCompleted
        }
    }
    
    public func encodePayload() -> Data? {
        let encoder = JSONEncoder()
        
        switch self {
        case let .itemForged(item: item):
            let payload = ForgedItemPayload(forgedItem: item)
            return try! encoder.encode(payload)
        case .celebrationDanceCompleted:
            return nil
        }
    }
}
