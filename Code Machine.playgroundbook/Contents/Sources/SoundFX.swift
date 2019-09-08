// 
//  SoundFX.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved. 
//

import Foundation
import AVFoundation
import PlaygroundSupport

var audioController = AudioController()

class AudioController: NSObject, AVAudioPlayerDelegate {
    
    private let audioEnabledKey = "AudioEnabled"
    
    var activeAudioPlayers = Set<AVAudioPlayer>()
    
    private var backgroundAudioPlayer: AVAudioPlayer?
    
    var isAudioEnabled: Bool {
        get {
            if case let .boolean(enabled)? = PlaygroundKeyValueStore.current[audioEnabledKey] {
                return enabled
            }
            return true
        }
        set {
            PlaygroundKeyValueStore.current[audioEnabledKey] = PlaygroundValue.boolean(newValue)
            
            if !newValue {
                stopAllPlayers()
            }
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        activeAudioPlayers.remove(player)
    }
    
    func register(_ player: AVAudioPlayer) {
        activeAudioPlayers.insert(player)
        player.delegate = self
    }
    
    func stopAllPlayers() {
        activeAudioPlayers.forEach { $0.stop() }
        activeAudioPlayers.removeAll()
    }
    
    func stopAllPlayersExceptBackgroundAudio() {
        activeAudioPlayers.filter{ $0 != backgroundAudioPlayer }.forEach {
            $0.stop()
            activeAudioPlayers.remove($0)
        }
    }
    
    func playBackgroundAudioLoop(_ sound: Sound, volume: Int = 80) {
        guard let url = sound.url, isAudioEnabled else { return }
        
        if let _ = backgroundAudioPlayer {
            stopBackgroundAudioLoop()
        }
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.volume = Float(max(min(volume, 100), 0)) / 100.0
            register(audioPlayer)
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            backgroundAudioPlayer = audioPlayer
        } catch {}
    }
    
    func pauseBackgroundAudioLoop() {
        guard let audioPlayer = backgroundAudioPlayer else { return }
        audioPlayer.pause()
    }
    
    func resumeBackgroundAudioLoop() {
        guard let audioPlayer = backgroundAudioPlayer else { return }
        audioPlayer.play()
    }
    
    func stopBackgroundAudioLoop() {
        guard let audioPlayer = backgroundAudioPlayer else { return }
        audioPlayer.stop()
        activeAudioPlayers.remove(audioPlayer)
        backgroundAudioPlayer = nil
    }
}

/// Plays the given sound. Optionally specify a volume from 0 (silent) to 100 (loudest), with 80 being the default.
///
/// - Parameter sound: The sound to be played.
/// - Parameter volume: The volume at which the sound is to be played (0 to 100).
/// - Parameter waitUntilDone: Pause execution until the sound has finished playing. Default is `false`.
///
/// - localizationKey: playSound(_:volume:waitUntilDone:)
public func playSound(_ sound: Sound, volume: Int = 80, waitUntilDone: Bool = false) {
    
    guard
        !AudioSession.current.isPlaybackBlocked,
        audioController.isAudioEnabled,
        let url = sound.url
        else { return }
    
    do {
        let audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer.volume = Float(max(min(volume, 100), 0)) / 100.0
        audioController.register(audioPlayer)
        audioPlayer.play()
        
        if waitUntilDone {
            repeat {
                RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.25))
            } while (audioController.activeAudioPlayers.contains(audioPlayer))
        }
    } catch {}
}

/// An enumeration of all the different sounds that can be played.
///
/// - localizationKey: Sound
public enum Sound: String, Codable {
    
    case clank, entering3, entering4, equipped1, equipped2, lightSwitchOn, newIngredient1, newIngredient2, newIngredient3, newIngredient5, newIngredient6, newIngredient7, newIngredient8, newIngredient9, newIngredient10, processing1, processing2, processing3, processing4, processing8, stretchProcess, huffProcess, switch1, switch2, whistle, poppingOut1, poppingOut2, poppingOut3, poppingOut4, brick1, brick2, brick3, brick4, finalProduct1, finalProduct2, finalProduct3, finalProduct4, finalProduct5, finalProduct6, finalProduct7, machineIdling1, itemRemoved1, itemRemoved2, tray1, tray2, tray3, tray4, oldProduct1, oldProduct2, machineNoise1, machineNoise2, machineNoise3, machineNoise4, machineNoise5, machineNoise6, machineNoise7, machineNoise8, machineNoise9, machineNoise10, fastForging1, fastForging2, fastForging3, fastEntering, vocalHello, vocalHiThere, vocalCongrats, vocalMiniGrats, vocalExcuseMe, idleVocal1, idleVocal2, idleVocal3, idleVocal4, celebration
    
    var url : URL? {
        
        var fileName: String?
        
        switch self {
        case .tray1:
            fileName = "Organic Attach_001"
        case .tray2:
            fileName = "Organic Attach_002"
        case .tray3:
            fileName = "Organic Attach_005"
        case .tray4:
            fileName = "Organic Attach_008"
        case .clank:
            fileName = "Clank"
        case .entering3:
            fileName = "entering1"
        case .entering4:
            fileName = "entering2"
        case .equipped1:
            fileName = "itemEquipped1"
        case .equipped2:
            fileName = "itemEquipped2"
        case .finalProduct1:
            fileName = "finalProduct1"
        case .finalProduct2:
            fileName = "finalProduct2"
        case .finalProduct3:
            fileName = "finalProduct3"
        case .finalProduct4:
            fileName = "finalProduct4"
        case .finalProduct5:
            fileName = "finalProduct5"
        case .finalProduct6:
            fileName = "092717_New final product created, electronic rkv1"
        case .finalProduct7:
            fileName = "092717_New final product created, electronic rkv2"
        case .lightSwitchOn:
            fileName = "Light_Switch_On"
        case .newIngredient1:
            fileName = "New_Ingredient_001"
        case .newIngredient2:
            fileName = "New_Ingredient_002"
        case .newIngredient3:
            fileName = "New_Ingredient_003"
        case .oldProduct1:
            fileName = "Organic Attach_012"
        case .oldProduct2:
            fileName = "Organic Attach_013"
        case .newIngredient5:
            fileName = "newIngredient5"
        case .newIngredient6:
            fileName = "newIngredient6"
        case .newIngredient7:
            fileName = "newIngredient7"
        case .newIngredient8:
            fileName = "newIngredient8"
        case .newIngredient9:
            fileName = "newIngredient9"
        case .newIngredient10:
            fileName = "newIngredient10"
        case .machineIdling1:
            fileName = "machineIdling1"
        case .brick1:
            fileName = "Comedy_Low_Honk"
        case .brick2:
            fileName = "brick2"
        case .brick3:
            fileName = "brick3"
        case .brick4:
            fileName = "brick4"
        case .processing1:
            fileName = "Processing_001"
        case .processing2:
            fileName = "Processing_002"
        case .processing3:
            fileName = "Processing_003"
        case .processing4:
            fileName = "Processing_004"
        case .processing8:
            fileName = "Processing_008"
        case .stretchProcess:
            fileName = "Stretch_Process_001"
        case .huffProcess:
            fileName = "Huff_Process_001"
        case .switch1:
            fileName = "Switch_001"
        case .switch2:
            fileName = "Light_Switch_001"
        case .whistle:
            fileName = "Comedy_Whistle"
        case .poppingOut1:
            fileName = "poppingOut1short"
        case .poppingOut2:
            fileName = "poppingOut2short"
        case .poppingOut3:
            fileName = "poppingOut3short"
        case .poppingOut4:
            fileName = "poppingOut4short"
        case .itemRemoved1:
            fileName = "itemRemoved1"
        case .itemRemoved2:
            fileName = "itemRemoved2"
        case .machineNoise1:
            fileName = "092917_Machine noise rkv1"
        case .machineNoise2:
            fileName = "092917_Machine noise rkv2"
        case .machineNoise3:
            fileName = "Machine Noises_001"
        case .machineNoise4:
            fileName = "Machine Noises_002"
        case .machineNoise5:
            fileName = "Machine Noises_005"
        case .machineNoise6:
            fileName = "092917_Machine noise rkv6"
        case .machineNoise7:
            fileName = "092917_Machine noise rkv7"
        case .machineNoise8:
            fileName = "092717_Random machine sounds rkv1"
        case .machineNoise9:
            fileName = "092717_Random machine sounds rkv2"
        case .machineNoise10:
            fileName = "092717_Random machine sounds rkv3"
        case .fastForging1:
            fileName = "fastForging1"
        case .fastForging2:
            fileName = "fastForging2"
        case .fastForging3:
            fileName = "fastForging3"
        case .fastEntering:
            fileName = "fastEntering"
        case .vocalHello:
            fileName = "vocalHello"
        case .vocalHiThere:
            fileName = "vocalHiThere"
        case .vocalCongrats:
            fileName = "vocalCongrats"
        case .vocalMiniGrats:
            fileName = "vocalMiniGrats"
        case .vocalExcuseMe:
            fileName = "vocalExcuseMe"
        case .idleVocal1:
            fileName = "idleVocal1"
        case .idleVocal2:
            fileName = "idleVocal2"
        case .idleVocal3:
            fileName = "idleVocal3"
        case .idleVocal4:
            fileName = "idleVocal4"
        case .celebration:
            fileName = "Up_Sweeper"
        }
        guard let resourceName = fileName else { return nil }
        
        return Bundle.main.url(forResource: resourceName, withExtension: "m4a")
    }
}

public struct SoundFX {
    // The machine appears
    static var machineAppearingSound: Sound { return [.machineNoise4].randomItem }

    // First, items are taken from the tray
    static var addItemSound: Sound { return [.tray1, .tray2, .tray3, .tray4].randomItem }
    
    static var currentAddItemSound: Sound = .tray1
    
    // Second, items enter into the funnel (this will occur in sequence with the tray sound for each item)
    static var enteringFunnel: Sound { return [.entering3, .entering4].randomItem }
    
    // A light is switched on, if applicable.
    static var switchLight: Sound { return .switch2 }
    
    // The machine then processes the items
    static var forgingSound: Sound { return [.stretchProcess, .huffProcess, .processing1, .processing2, .processing3, .processing4, .processing8].randomItem }
    
    // The machine then processes the items faster
    static var fastForgingSound: Sound { return [.fastForging1, .fastForging2, .fastForging3].randomItem }

    // The machine then shoots the product out
    static var poppingOut: Sound { return [.poppingOut1, .poppingOut2, .poppingOut3, .poppingOut4].randomItem }
    
    // Depending on the product, a different sound plays
    static var forgedBrickSound: Sound { return [.brick1, .brick2, .brick3, .brick4].randomItem }
    
    static var forgedBaseMaterialSound: Sound { return .newIngredient3 }
    
    static var forgedNewSecondaryItemSound: Sound { return [.newIngredient5, .newIngredient6, .newIngredient7, .newIngredient7, .newIngredient8, .newIngredient9, .newIngredient10].randomItem}
    static var forgedSecondaryItemSound: Sound { return [.oldProduct1, .oldProduct2].randomItem }
    
    static var forgedFinalProductSound: Sound { return [.finalProduct1, .finalProduct2, .finalProduct3, .finalProduct4, .finalProduct5, .finalProduct6, .finalProduct7].randomItem }
    static var forgedOldFInalProductSound: Sound { return [.newIngredient1, .newIngredient2].randomItem }
    
    
    // Equipping and Unequipping
    static var equippedItemSound: Sound { return [.equipped1, .equipped2].randomItem }
    static var removedItemSound: Sound { return [.itemRemoved1, .itemRemoved2].randomItem }
    
    // Idling
    static var idling: Sound { return .machineIdling1 }
    static var idlingVocalization: Sound { return [.machineNoise10, .vocalHello, .vocalExcuseMe, .idleVocal1, .idleVocal2, .idleVocal3, .idleVocal4].randomItem }

    // Random machine sounds (
    static var machineSounds: Sound { return [.machineNoise1, .machineNoise2, .machineNoise3, .machineNoise9].randomItem }
    
    // Congrats
    public static var congrats: Sound { return [.vocalMiniGrats, .machineNoise5, .vocalHiThere, .vocalExcuseMe].randomItem }

    // Vocalizations (could be used after tap gestures or when a successful assessment has occurred)
    public static var machineVocalizations: Sound { return [.machineNoise4, .machineNoise5, .machineNoise6, .machineNoise7, .machineNoise8, .machineNoise10].randomItem }
    
    static func playForgedSound(for forgedItem: ForgedItem) {
        // Play the appropriate sound.
        if forgedItem.item == .brick {
            playSound(SoundFX.forgedBrickSound)
        } else if forgedItem.item.isBaseMaterial {
            playSound(SoundFX.forgedBaseMaterialSound)
        } else if forgedItem.item.isFinalProduct {
            if forgedItem.isForgedFirstTime {
                playSound(SoundFX.forgedFinalProductSound)
            } else {
                playSound(SoundFX.forgedOldFInalProductSound)
            }
        } else if forgedItem.item.isSecondaryItem {
            if forgedItem.isForgedFirstTime {
                playSound(SoundFX.forgedNewSecondaryItemSound)
            } else {
                playSound(SoundFX.forgedSecondaryItemSound)
            }
        } else {
            playSound(.clank)
        }
    }
}
