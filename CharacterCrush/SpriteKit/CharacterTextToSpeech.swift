//
//  CharacterTextToSpeech.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 14.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import Foundation
import AVKit

/// A simple text-to-speech engine based on Apple's AVKit.
class CharacterTextToSpeech {

    var isMuted = false
    
    private let synthesizer = AVSpeechSynthesizer()
    private let voice: AVSpeechSynthesisVoice?
    
    init(language: String) {
        self.voice = AVSpeechSynthesisVoice(language: language)
    }
    
    func pronounce(character: Character) {
        guard !isMuted, let voice = voice else { return }
        
        let utterance = AVSpeechUtterance(string: String(character))
        utterance.voice = voice
        synthesizer.stopSpeaking(at: .immediate)
        synthesizer.speak(utterance)
    }
    
}
