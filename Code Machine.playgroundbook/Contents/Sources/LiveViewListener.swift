//
//  LiveViewListener.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved. 
//

import Foundation
import PlaygroundSupport

public class LiveViewListener: PlaygroundRemoteLiveViewProxyDelegate {
    
    public func remoteLiveViewProxy(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy, received message: PlaygroundValue) {

        guard let liveViewMessage = PlaygroundMessageFromLiveView(playgroundValue: message) else { return }
        
        switch liveViewMessage {
        case let .itemForged(item: item):
            
            forgedItem = item
            
            assessmentController?.append(.forgedItem(item: item))
            
            // Allow main run loop to complete first so it can be unblocked in forgeItems().
            DispatchQueue.main.async {
                performAssessment()
            }
        case .celebrationDanceCompleted:
            
            assessmentController?.append(.celebrationDanceCompleted)
        }
    }
    
    public func remoteLiveViewProxyConnectionClosed(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy) { }
    
    public init(for proxy: PlaygroundRemoteLiveViewProxy?) {
        proxy?.delegate = self
    }
}

