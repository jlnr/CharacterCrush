//
//  Hanzi.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 14.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import Foundation

struct Hanzi {
    // The Chinese character, e.g. 好.
    let character: Character
    // Pinyin each tone, e.g. nil, nil, "hǎo", "hào".
    let firstTone: String?
    let secondTone: String?
    let thirdTone: String?
    let fourthTone: String?
}

extension Hanzi {
    struct Tones: OptionSet, Hashable {
        let rawValue: Int
        
        static let first  = Tones(rawValue: 1 << 0)
        static let second = Tones(rawValue: 1 << 1)
        static let third  = Tones(rawValue: 1 << 2)
        static let fourth = Tones(rawValue: 1 << 3)
        
        static let all: Tones = [.first, .second, .third, .fourth]
    }
    
    func sharedTones(tones: Tones) -> Tones {
        var sharedTones = tones
        if firstTone == nil {
            sharedTones.remove(.first)
        }
        if secondTone == nil {
            sharedTones.remove(.second)
        }
        if thirdTone == nil {
            sharedTones.remove(.third)
        }
        if fourthTone == nil {
            sharedTones.remove(.fourth)
        }
        return sharedTones
    }
    
    var isJoker: Bool {
        var tones = 0
        if firstTone != nil {
            tones += 1
        }
        if secondTone != nil {
            tones += 1
        }
        if thirdTone != nil {
            tones += 1
        }
        if fourthTone != nil {
            tones += 1
        }
        return tones >= 2
    }
}
