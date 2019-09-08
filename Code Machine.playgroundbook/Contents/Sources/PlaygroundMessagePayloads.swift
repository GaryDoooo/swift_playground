//
//  PlaygroundMessagePayloads.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved. 
//

import Foundation

protocol PlaygroundMessagePayload: Codable {}

// Might keep these around to help figure out if a send() method could be useful, if the parameters passed could be filtered based on what type they are and their destination.
protocol CodeToLiveViewMessage {}
protocol LiveViewToCodeMessage {}

struct TestOnePayload : PlaygroundMessagePayload, CodeToLiveViewMessage {
    var name : String
}

struct TestTwoPayload : PlaygroundMessagePayload, LiveViewToCodeMessage {
    var number1 : Int
    var number2 : Int
}

struct ItemPayload : PlaygroundMessagePayload, CodeToLiveViewMessage {
    var item : Thing
}

struct ForgedItemPayload : PlaygroundMessagePayload, CodeToLiveViewMessage {
    var forgedItem : ForgedItem
}

struct LightPayload : PlaygroundMessagePayload, CodeToLiveViewMessage {
    var light : Light
    var isOn : SwitchState
}

struct SpeedPayload : PlaygroundMessagePayload, CodeToLiveViewMessage {
    var speed : Speed
}

struct BoolPayload : PlaygroundMessagePayload, CodeToLiveViewMessage {
    var value : Bool
}

struct EquipAlertsPayload : PlaygroundMessagePayload, CodeToLiveViewMessage {
    var enabled: Bool
    var autoEquip: Bool
}

struct SoundPayload : PlaygroundMessagePayload, CodeToLiveViewMessage {
    var sound : Sound
}

