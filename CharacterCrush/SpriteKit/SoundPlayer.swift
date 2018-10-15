//
//  SoundPlayer.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 14.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import Foundation
import AVKit

/// A simple text-to-speech engine based on Apple's AVKit, plus methods to play back some system
/// sounds for game-related feedback.
class SoundPlayer {

    var isMuted = false
    var tickID: SystemSoundID = 0
    var successID: SystemSoundID = 0
    
    private let synthesizer = AVSpeechSynthesizer()
    private let voice: AVSpeechSynthesisVoice?
    
    init(voiceLanguage: String) {
        self.voice = AVSpeechSynthesisVoice(language: voiceLanguage) ?? AVSpeechSynthesisVoice(language: "zh")
        
        let tickFile = URL(fileURLWithPath: "/System/Library/Audio/UISounds/acknowledgment_sent.caf")
        AudioServicesCreateSystemSoundID(tickFile as CFURL, &tickID);
        
        let successFile = URL(fileURLWithPath: "/System/Library/Audio/UISounds/health_notification.caf")
        AudioServicesCreateSystemSoundID(successFile as CFURL, &successID);

    }
    
    func pronounce(character: Character) {
        guard !isMuted, let voice = voice else { return }
        
        let utterance = AVSpeechUtterance(string: String(character))
        utterance.voice = voice
        synthesizer.stopSpeaking(at: .immediate)
        synthesizer.speak(utterance)
    }
    
    func playTick() {
        guard !isMuted else { return }
        
        AudioServicesPlaySystemSound(tickID)
    }
    
    func playSuccess() {
        guard !isMuted else { return }
        
        AudioServicesPlaySystemSound(successID)
    }
    
}
