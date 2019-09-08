//
//  AudioController.swift
//  SupportingContent
//
//  Copyright © 2018 Apple Inc. All rights reserved.
//
import Foundation
import AVFoundation
import PlaygroundSupport


var audioController = AudioController()

@objc
class AudioController: NSObject, AVAudioPlayerDelegate {
    
    var backgroundAudioMusic: Music? = nil
    
    var isBackgroundAudioLoopPlaying: Bool {
        guard let audioPlayer = backgroundAudioPlayer else { return false }
        return audioPlayer.isPlaying
    }
    
    var activeAudioPlayers = Set<AVAudioPlayer>()
    
    private var backgroundAudioPlayer: AVAudioPlayer?
    
    var isBackgroundAudioEnabled: Bool {
        get {
            return PersistentStore.isBackgroundAudioEnabled
        }
        set {
            PersistentStore.isBackgroundAudioEnabled = newValue
            
            if !newValue {
                stopAllPlayers()
            }
        }
    }
    
    var isSoundEffectsAudioEnabled: Bool {
        get {
            return PersistentStore.isSoundEffectsEnabled
        }
        set {
            PersistentStore.isSoundEffectsEnabled = newValue
        }
    }

    var isAllAudioEnabled: Bool {
        get {
            return PersistentStore.isAllAudioEnabled
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
    
    func playBackgroundAudioLoop(_ sound: Music, volume: Int = 80) {
        guard let url = sound.url, isBackgroundAudioEnabled else { return }
        
        if let _ = backgroundAudioPlayer {
            stopBackgroundAudioLoop()
        }
        
        backgroundAudioMusic = sound

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
        backgroundAudioMusic = nil
        activeAudioPlayers.remove(audioPlayer)
        backgroundAudioPlayer = nil
    }
    
    func adjustBackgroundAudioLoop(volume: Int) {
        backgroundAudioPlayer?.volume = Float(max(min(volume, 100), 0)) / 100.0
    }
}

