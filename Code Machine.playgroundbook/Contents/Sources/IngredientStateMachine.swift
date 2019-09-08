//
//  IngredientStateMachine.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved. 
//

import Foundation

typealias LightsState = (red:Bool, green:Bool, blue:Bool)

protocol StateMachineDelegate : class {
    // Called when either ItemA or ItemB is changed, but only the one that changed will be present.
    func itemDidChange(stateMachine: IngredientStateMachine, itemA: Thing?, itemB: Thing?)
    func lightsDidChange(stateMachine: IngredientStateMachine, lightState: LightsState)
    func didForgeItems(stateMachine: IngredientStateMachine, itemA: Thing, itemB: Thing, forgedItem: ForgedItem)
}

class IngredientStateMachine {
    weak var delegate : StateMachineDelegate?
    
    var itemA : Thing = .undefined {
        didSet {
            delegate?.itemDidChange(stateMachine: self, itemA: itemA, itemB: nil)
        }
    }
    
    var itemB : Thing = .undefined {
        didSet {
            delegate?.itemDidChange(stateMachine: self, itemA: nil, itemB: itemB)
        }
    }
    
    var lights : LightsState = (red:false, green:false, blue:false) {
        didSet {
            delegate?.lightsDidChange(stateMachine: self, lightState: lights)
        }
    }
    
    var currentLight: Light? {
        if lights.red {
            return .red
        }
        else if lights.green {
            return .green
        }
        else if lights.blue {
            return .blue
        }
        return nil
    }
    
    var currentRecipe: Recipe {
        return Recipe(itemA: itemA, itemB: itemB, light: currentLight)
    }

    internal func reset() {
        itemA = .undefined
        itemB = .undefined
        lights = (red:false, green:false, blue:false)
        delegate?.didForgeItems(stateMachine: self, itemA: .undefined, itemB: .undefined, forgedItem: .undefined)
    }
    
    func forgeItems() -> Thing {
        let result = _resolveState()
        let forgedFirstTime = !result.hasBeenForged
        let forgedItem = ForgedItem(item: result, recipe: currentRecipe, isForgedFirstTime: forgedFirstTime)
        delegate?.didForgeItems(stateMachine: self, itemA: itemA, itemB: itemB, forgedItem: forgedItem)
        return result
    }
     
    private func _resolveState() -> Thing {
        if itemA == .brick || itemB == .brick { return .brick }
        
        // Item combination code generated from HoCCraftingCombinationTable.csv and CraftCSVToCode.py
        if itemA == .metal && itemB == .metal { if lights.red { return .gear } }
        if itemA == .metal && itemB == .metal { return .brick }
        if itemA == .metal && itemB == .stone || itemA == .stone && itemB == .metal { return .spring }
        if itemA == .metal && itemB == .cloth || itemA == .cloth && itemB == .metal { return .wire }
        if itemA == .metal && itemB == .dirt || itemA == .dirt && itemB == .metal { return .spring }
        if itemA == .metal && itemB == .DNA || itemA == .DNA && itemB == .metal { return .cyborgEyeballs }
        if itemA == .dirt && itemB == .dirt { return .brick }
        if itemA == .dirt && itemB == .stone || itemA == .stone && itemB == .dirt { if lights.green { return .seed } }
        if itemA == .dirt && itemB == .stone || itemA == .stone && itemB == .dirt { if lights.blue { return .crystal } }
        if itemA == .dirt && itemB == .stone || itemA == .stone && itemB == .dirt { if lights.red { return .brick } }
        if itemA == .dirt && itemB == .cloth || itemA == .cloth && itemB == .dirt { return .brick }
        if itemA == .dirt && itemB == .DNA || itemA == .DNA && itemB == .dirt { return .tree }
        if itemA == .cloth && itemB == .cloth { return .brick }
        if itemA == .cloth && itemB == .stone || itemA == .stone && itemB == .cloth { if lights.blue { return .stoneMask } }
        if itemA == .cloth && itemB == .stone || itemA == .stone && itemB == .cloth { return .brick }
        if itemA == .cloth && itemB == .DNA || itemA == .DNA && itemB == .cloth { return .brick }
        if itemA == .stone && itemB == .stone { if lights.blue { return .stoneMask } }
        if itemA == .stone && itemB == .stone { if lights.red { return .crystal } }
        if itemA == .stone && itemB == .stone { return .brick }
        if itemA == .stone && itemB == .DNA || itemA == .DNA && itemB == .stone { if lights.red { return .brick } }
        if itemA == .stone && itemB == .DNA || itemA == .DNA && itemB == .stone { return .egg }
        if itemA == .DNA && itemB == .DNA { if lights.green { return .seed } }
        if itemA == .DNA && itemB == .DNA { return .brick }
        if itemA == .metal && itemB == .spring || itemA == .spring && itemB == .metal { if lights.red { return .electricHoolahoop } }
        if itemA == .metal && itemB == .spring || itemA == .spring && itemB == .metal { return .gear }
        if itemA == .metal && itemB == .wire || itemA == .wire && itemB == .metal { if lights.red { return .electricHoolahoop } }
        if itemA == .metal && itemB == .wire || itemA == .wire && itemB == .metal { if lights.green { return .mechanicalWig } }
        if itemA == .metal && itemB == .wire || itemA == .wire && itemB == .metal { return .spring }
        if itemA == .metal && itemB == .egg || itemA == .egg && itemB == .metal { if lights.red { return .friedEggs } }
        if itemA == .metal && itemB == .egg || itemA == .egg && itemB == .metal { return .brick }
        if itemA == .metal && itemB == .tree || itemA == .tree && itemB == .metal { return .brick }
        if itemA == .metal && itemB == .gear || itemA == .gear && itemB == .metal { if lights.red { return .chromeShredderWheels } }
        if itemA == .metal && itemB == .gear || itemA == .gear && itemB == .metal { return .brick }
        if itemA == .metal && itemB == .seed || itemA == .seed && itemB == .metal { return .brick }
        if itemA == .metal && itemB == .crystal || itemA == .crystal && itemB == .metal { if lights.blue { return .spiralingStalactites } }
        if itemA == .metal && itemB == .crystal || itemA == .crystal && itemB == .metal { return .brick }
        if itemA == .metal && itemB == .mushroom || itemA == .mushroom && itemB == .metal { if lights.blue { return .mushroomHelmet } }
        if itemA == .metal && itemB == .mushroom || itemA == .mushroom && itemB == .metal { return .brick }
        if itemA == .metal && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .metal { return .cyborgEyeballs }
        if itemA == .dirt && itemB == .spring || itemA == .spring && itemB == .dirt { return .brick }
        if itemA == .dirt && itemB == .wire || itemA == .wire && itemB == .dirt { return .wire }
        if itemA == .dirt && itemB == .egg || itemA == .egg && itemB == .dirt { if lights.green { return .flamingoBouquet } }
        if itemA == .dirt && itemB == .egg || itemA == .egg && itemB == .dirt { return .brick }
        if itemA == .dirt && itemB == .tree || itemA == .tree && itemB == .dirt { return .brick }
        if itemA == .dirt && itemB == .gear || itemA == .gear && itemB == .dirt { return .brick }
        if itemA == .dirt && itemB == .seed || itemA == .seed && itemB == .dirt { if lights.green { return .pumpkinHand } }
        if itemA == .dirt && itemB == .seed || itemA == .seed && itemB == .dirt { return .tree }
        if itemA == .dirt && itemB == .crystal || itemA == .crystal && itemB == .dirt { return .brick }
        if itemA == .dirt && itemB == .mushroom || itemA == .mushroom && itemB == .dirt { if lights.blue { return .glowingMushroomShoes } }
        if itemA == .dirt && itemB == .mushroom || itemA == .mushroom && itemB == .dirt { if lights.green { return .glowingMushroomShoes } }
        if itemA == .dirt && itemB == .mushroom || itemA == .mushroom && itemB == .dirt { return .unidentifiedLifeForm }
        if itemA == .dirt && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .dirt { return .tree }
        if itemA == .cloth && itemB == .spring || itemA == .spring && itemB == .cloth { return .extendoHat }
        if itemA == .cloth && itemB == .wire || itemA == .wire && itemB == .cloth { if lights.blue { return .extendoHat } }
        if itemA == .cloth && itemB == .wire || itemA == .wire && itemB == .cloth { return .spring }
        if itemA == .cloth && itemB == .egg || itemA == .egg && itemB == .cloth { return .brick }
        if itemA == .cloth && itemB == .tree || itemA == .tree && itemB == .cloth { return .seed }
        if itemA == .cloth && itemB == .gear || itemA == .gear && itemB == .cloth { if lights.red { return .turboFanBladePropeller } }
        if itemA == .cloth && itemB == .gear || itemA == .gear && itemB == .cloth { return .extendoHat }
        if itemA == .cloth && itemB == .seed || itemA == .seed && itemB == .cloth { if lights.green { return .snapPeaTutu } }
        if itemA == .cloth && itemB == .seed || itemA == .seed && itemB == .cloth { return .tree }
        if itemA == .cloth && itemB == .crystal || itemA == .crystal && itemB == .cloth { if lights.blue { return .flowyRainbowRibbon } }
        if itemA == .cloth && itemB == .crystal || itemA == .crystal && itemB == .cloth { if lights.red { return .diamondJacket } }
        if itemA == .cloth && itemB == .crystal || itemA == .crystal && itemB == .cloth { return .brick }
        if itemA == .cloth && itemB == .mushroom || itemA == .mushroom && itemB == .cloth { if lights.green { return .glowingMushroomShoes } }
        if itemA == .cloth && itemB == .mushroom || itemA == .mushroom && itemB == .cloth { if lights.blue { return .flowyRainbowRibbon } }
        if itemA == .cloth && itemB == .mushroom || itemA == .mushroom && itemB == .cloth { return .unidentifiedLifeForm }
        if itemA == .cloth && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .cloth { if lights.green { return .dragonWings } }
        if itemA == .cloth && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .cloth { if lights.red { return .meatballSleeve } }
        if itemA == .cloth && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .cloth { return .mushroom }
        if itemA == .stone && itemB == .spring || itemA == .spring && itemB == .stone { if lights.red { return .springLoadedFist } }
        if itemA == .stone && itemB == .spring || itemA == .spring && itemB == .stone { return .brick }
        if itemA == .stone && itemB == .wire || itemA == .wire && itemB == .stone { return .spring }
        if itemA == .stone && itemB == .egg || itemA == .egg && itemB == .stone { if lights.green { return .dragonWings } }
        if itemA == .stone && itemB == .egg || itemA == .egg && itemB == .stone { return .brick }
        if itemA == .stone && itemB == .tree || itemA == .tree && itemB == .stone { return .brick }
        if itemA == .stone && itemB == .gear || itemA == .gear && itemB == .stone { if lights.red { return .chromeShredderWheels } }
        if itemA == .stone && itemB == .seed || itemA == .seed && itemB == .stone { return .brick }
        if itemA == .stone && itemB == .crystal || itemA == .crystal && itemB == .stone { if lights.blue { return .spiralingStalactites } }
        if itemA == .stone && itemB == .crystal || itemA == .crystal && itemB == .stone { return .brick }
        if itemA == .stone && itemB == .mushroom || itemA == .mushroom && itemB == .stone { return .brick }
        if itemA == .stone && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .stone { return .egg }
        if itemA == .DNA && itemB == .spring || itemA == .spring && itemB == .DNA { if lights.green { return .ostrichLegs } }
        if itemA == .DNA && itemB == .spring || itemA == .spring && itemB == .DNA { return .brick }
        if itemA == .DNA && itemB == .wire || itemA == .wire && itemB == .DNA { return .spring }
        if itemA == .DNA && itemB == .egg || itemA == .egg && itemB == .DNA { if lights.green { return .flamingoBouquet } }
        if itemA == .DNA && itemB == .egg || itemA == .egg && itemB == .DNA { return .unidentifiedLifeForm }
        if itemA == .DNA && itemB == .tree || itemA == .tree && itemB == .DNA { if lights.green { return .mushroom } }
        if itemA == .DNA && itemB == .tree || itemA == .tree && itemB == .DNA { return .seed }
        if itemA == .DNA && itemB == .gear || itemA == .gear && itemB == .DNA { return .brick }
        if itemA == .DNA && itemB == .seed || itemA == .seed && itemB == .DNA { if lights.green { return .pumpkinHand } }
        if itemA == .DNA && itemB == .seed || itemA == .seed && itemB == .DNA { return .brick }
        if itemA == .DNA && itemB == .crystal || itemA == .crystal && itemB == .DNA { if lights.blue { return .spiralingStalactites } }
        if itemA == .DNA && itemB == .crystal || itemA == .crystal && itemB == .DNA { if lights.green { return .octopusTentacle } }
        if itemA == .DNA && itemB == .crystal || itemA == .crystal && itemB == .DNA { return .brick }
        if itemA == .DNA && itemB == .mushroom || itemA == .mushroom && itemB == .DNA { return .unidentifiedLifeForm }
        if itemA == .DNA && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .DNA { if lights.blue { return .blu } }
        if itemA == .DNA && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .DNA { if lights.green { return .flamingoBouquet } }
        if itemA == .DNA && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .DNA { return .brick }
        if itemA == .spring && itemB == .spring { return .brick }
        if itemA == .spring && itemB == .wire || itemA == .wire && itemB == .spring { if lights.red { return .electricHoolahoop } }
        if itemA == .spring && itemB == .wire || itemA == .wire && itemB == .spring { if lights.blue { return .extendoHat } }
        if itemA == .spring && itemB == .wire || itemA == .wire && itemB == .spring { return .brick }
        if itemA == .spring && itemB == .egg || itemA == .egg && itemB == .spring { return .ostrichLegs }
        if itemA == .spring && itemB == .tree || itemA == .tree && itemB == .spring { if lights.red { return .purplePressurePistons } }
        if itemA == .spring && itemB == .tree || itemA == .tree && itemB == .spring { if lights.red { return .springLoadedFist } }
        if itemA == .spring && itemB == .tree || itemA == .tree && itemB == .spring { return .brick }
        if itemA == .spring && itemB == .gear || itemA == .gear && itemB == .spring { if lights.red { return .purplePressurePistons } }
        if itemA == .spring && itemB == .gear || itemA == .gear && itemB == .spring { return .brick }
        if itemA == .spring && itemB == .seed || itemA == .seed && itemB == .spring { return .brick }
        if itemA == .spring && itemB == .crystal || itemA == .crystal && itemB == .spring { if lights.red { return .spiralingStalactites } }
        if itemA == .spring && itemB == .crystal || itemA == .crystal && itemB == .spring { return .brick }
        if itemA == .spring && itemB == .mushroom || itemA == .mushroom && itemB == .spring { return .brick }
        if itemA == .spring && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .spring { if lights.green { return .octopusTentacle } }
        if itemA == .spring && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .spring { return .brick }
        if itemA == .wire && itemB == .wire { if lights.red { return .electricHoolahoop } }
        if itemA == .wire && itemB == .wire { if lights.green { return .mechanicalWig } }
        if itemA == .wire && itemB == .wire { return .brick }
        if itemA == .wire && itemB == .egg || itemA == .egg && itemB == .wire { if lights.green { return .eagleSunglasses } }
        if itemA == .wire && itemB == .egg || itemA == .egg && itemB == .wire { return .brick }
        if itemA == .wire && itemB == .tree || itemA == .tree && itemB == .wire { return .brick }
        if itemA == .wire && itemB == .gear || itemA == .gear && itemB == .wire { if lights.green { return .mechanicalWig } }
        if itemA == .wire && itemB == .gear || itemA == .gear && itemB == .wire { return .brick }
        if itemA == .wire && itemB == .seed || itemA == .seed && itemB == .wire { if lights.green { return .snapPeaTutu } }
        if itemA == .wire && itemB == .seed || itemA == .seed && itemB == .wire { return .brick }
        if itemA == .wire && itemB == .crystal || itemA == .crystal && itemB == .wire { if lights.blue { return .spiralingStalactites } }
        if itemA == .wire && itemB == .crystal || itemA == .crystal && itemB == .wire { return .brick }
        if itemA == .wire && itemB == .mushroom || itemA == .mushroom && itemB == .wire { return .brick }
        if itemA == .wire && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .wire { if lights.blue { return .octopusTentacle } }
        if itemA == .wire && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .wire { return .brick }
        if itemA == .egg && itemB == .egg { return .brick }
        if itemA == .egg && itemB == .tree || itemA == .tree && itemB == .egg { if lights.green { return .ostrichLegs } }
        if itemA == .egg && itemB == .tree || itemA == .tree && itemB == .egg { if lights.blue { return .eagleSunglasses } }
        if itemA == .egg && itemB == .tree || itemA == .tree && itemB == .egg { return .seed }
        if itemA == .egg && itemB == .gear || itemA == .gear && itemB == .egg { if lights.green { return .mechanicalWig } }
        if itemA == .egg && itemB == .gear || itemA == .gear && itemB == .egg { return .brick }
        if itemA == .egg && itemB == .seed || itemA == .seed && itemB == .egg { return .unidentifiedLifeForm }
        if itemA == .egg && itemB == .crystal || itemA == .crystal && itemB == .egg { if lights.green { return .dragonWings } }
        if itemA == .egg && itemB == .crystal || itemA == .crystal && itemB == .egg { return .brick }
        if itemA == .egg && itemB == .mushroom || itemA == .mushroom && itemB == .egg { return .brick }
        if itemA == .egg && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .egg { if lights.green { return .flamingoBouquet } }
        if itemA == .egg && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .egg { return .brick }
        if itemA == .tree && itemB == .tree { return .seed }
        if itemA == .tree && itemB == .gear || itemA == .gear && itemB == .tree { if lights.red { return .purplePressurePistons } }
        if itemA == .tree && itemB == .gear || itemA == .gear && itemB == .tree { return .brick }
        if itemA == .tree && itemB == .seed || itemA == .seed && itemB == .tree { if lights.green { return .mushroom } }
        if itemA == .tree && itemB == .seed || itemA == .seed && itemB == .tree { return .brick }
        if itemA == .tree && itemB == .crystal || itemA == .crystal && itemB == .tree { return .brick }
        if itemA == .tree && itemB == .mushroom || itemA == .mushroom && itemB == .tree { return .dirt }
        if itemA == .tree && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .tree { if lights.green { return .mushroom } }
        if itemA == .tree && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .tree { return .brick }
        if itemA == .gear && itemB == .gear { return .brick }
        if itemA == .gear && itemB == .seed || itemA == .seed && itemB == .gear { return .brick }
        if itemA == .gear && itemB == .crystal || itemA == .crystal && itemB == .gear { if lights.red { return .purplePressurePistons } }
        if itemA == .gear && itemB == .crystal || itemA == .crystal && itemB == .gear { return .brick }
        if itemA == .gear && itemB == .mushroom || itemA == .mushroom && itemB == .gear { if lights.blue { return .mushroomHelmet } }
        if itemA == .gear && itemB == .mushroom || itemA == .mushroom && itemB == .gear { return .brick }
        if itemA == .gear && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .gear { return .brick }
        if itemA == .seed && itemB == .seed { return .brick }
        if itemA == .seed && itemB == .crystal || itemA == .crystal && itemB == .seed { return .brick }
        if itemA == .seed && itemB == .mushroom || itemA == .mushroom && itemB == .seed { return .dirt }
        if itemA == .seed && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .seed { if lights.green { return .snapPeaTutu } }
        if itemA == .seed && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .seed { return .brick }
        if itemA == .crystal && itemB == .crystal { return .stone }
        if itemA == .crystal && itemB == .mushroom || itemA == .mushroom && itemB == .crystal { if lights.blue { return .spiralingStalactites } }
        if itemA == .crystal && itemB == .mushroom || itemA == .mushroom && itemB == .crystal { return .brick }
        if itemA == .crystal && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .crystal { if lights.green { return .octopusTentacle } }
        if itemA == .crystal && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .crystal { return .brick }
        if itemA == .mushroom && itemB == .mushroom { return .brick }
        if itemA == .mushroom && itemB == .unidentifiedLifeForm || itemA == .unidentifiedLifeForm && itemB == .mushroom { return .brick }
        if itemA == .unidentifiedLifeForm && itemB == .unidentifiedLifeForm { if lights.blue { return .blu } }
        if itemA == .unidentifiedLifeForm && itemB == .unidentifiedLifeForm { return .egg }
        
        // If all else fails...
        return .brick
    }
}
