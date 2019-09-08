//
//  PlaygroundMessageToLiveView.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved. 
//

import Foundation

/// An enumeration of messages that can be sent to the live view.
public enum PlaygroundMessageToLiveView: PlaygroundMessage {
    case setItemA(item: Thing)
    case setItemB(item: Thing)
    case forgeItems
    case switchLight(light: Light, onOff: SwitchState)
    case setSpeed(speed: Speed)
    case reset
    case enableEquipAlerts(enabled: Bool, autoEquip: Bool)
    case playSound(sound: Sound)
    case enableAutoPlayCelebrationDance(enabled: Bool)
    
    public enum MessageType: String, PlaygroundMessageType { 
        case setItemA
        case setItemB
        case forgeItems
        case switchLight
        case setSpeed
        case reset
        case enableEquipAlerts
        case playSound
        case enableAutoPlayCelebrationDance
    }
    
    public var messageType: MessageType {
        switch self {
        case .setItemA(item:):
            return .setItemA
        case .setItemB(item:):
            return .setItemB
        case .forgeItems:
            return .forgeItems
        case .switchLight(light:onOff:):
            return .switchLight
        case .setSpeed(speed:):
            return .setSpeed
        case .reset:
            return .reset
        case .enableEquipAlerts(enabled:autoEquip:):
            return .enableEquipAlerts
        case .playSound(speed:):
            return .playSound
        case .enableAutoPlayCelebrationDance(enabled:):
            return .enableAutoPlayCelebrationDance
        }
    }
    
    public init?(messageType: MessageType, encodedPayload: Data?) {
        let decoder = JSONDecoder()
        
        switch messageType {
        case .setItemA:
            guard let payload = encodedPayload,
                  let object = try? decoder.decode(ItemPayload.self, from: payload) else { return nil }
            self = .setItemA(item: object.item)
            
        case .setItemB:
            guard let payload = encodedPayload,
                  let object = try? decoder.decode(ItemPayload.self, from: payload) else { return nil }
            self = .setItemB(item: object.item)

        case .forgeItems:
            self = .forgeItems

        case .switchLight:
            guard let payload = encodedPayload,
                let object = try? decoder.decode(LightPayload.self, from: payload) else { return nil }
            self = .switchLight(light: object.light, onOff: object.isOn)

        case .setSpeed:
            guard let payload = encodedPayload,
                let object = try? decoder.decode(SpeedPayload.self, from: payload) else { return nil }
            self = .setSpeed(speed: object.speed)
            
        case .reset:
            self = .reset
            
        case .enableEquipAlerts:
            guard let payload = encodedPayload,
                let object = try? decoder.decode(EquipAlertsPayload.self, from: payload) else { return nil }
            self = .enableEquipAlerts(enabled: object.enabled, autoEquip: object.autoEquip)
            
        case .playSound:
            guard let payload = encodedPayload,
                let object = try? decoder.decode(SoundPayload.self, from: payload) else { return nil }
            self = .playSound(sound: object.sound)
            
        case .enableAutoPlayCelebrationDance:
            guard let payload = encodedPayload,
                let object = try? decoder.decode(BoolPayload.self, from: payload) else { return nil }
            self = .enableAutoPlayCelebrationDance(enabled: object.value)
        }
    }
    
    public func encodePayload() -> Data? {
        let encoder = JSONEncoder()
        
        switch self {
        case let .setItemA(item: item):
            let payload = ItemPayload(item: item)
            return try! encoder.encode(payload)
        case let .setItemB(item: item):
            let payload = ItemPayload(item: item)
            return try! encoder.encode(payload)
        case .forgeItems:
            return nil
        case let .switchLight(light: light, onOff: onOff):
            let payload = LightPayload(light: light, isOn: onOff)
            return try! encoder.encode(payload)
        case let .setSpeed(speed: speed):
            let payload = SpeedPayload(speed: speed)
            return try! encoder.encode(payload)
        case .reset:
            return nil
        case let .enableEquipAlerts(enabled: enabled, autoEquip: autoEquip):
            let payload = EquipAlertsPayload(enabled: enabled, autoEquip: autoEquip)
            return try! encoder.encode(payload)
        case let .playSound(sound: sound):
            let payload = SoundPayload(sound: sound)
            return try! encoder.encode(payload)
        case let .enableAutoPlayCelebrationDance(enabled: enabled):
            let payload = BoolPayload(value: enabled)
            return try! encoder.encode(payload)
        }
    }
}
