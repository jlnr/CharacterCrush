//
//  Hanzi.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 14.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import Foundation

/// A Chinese character that can appear in this game.
/// All characters are defined in `HanziDatabase.swift`.
struct Hanzi {
    /// The Chinese character, e.g. "好".
    let character: Character
    /// Pinyin for the first tone, or nil.
    let firstTone: String?
    /// Pinyin for the second tone, or nil.
    let secondTone: String?
    /// Pinyin for the third tone, or nil.
    let thirdTone: String?
    /// Pinyin for the fourth tone, or nil.
    let fourthTone: String?
}

// MARK: - Tones

extension Hanzi {
    /// An `OptionSet` that defines which tones a character can have.
    struct Tones: OptionSet, Hashable {
        let rawValue: Int
        
        static func singleTone(_ tone: Int) -> Tones {
            assert(tone >= 1 && tone <= 4)
            return Tones(rawValue: 1 << (tone - 1))
        }
        
        static let first  = singleTone(1)
        static let second = singleTone(2)
        static let third  = singleTone(3)
        static let fourth = singleTone(4)
        
        static let all: Tones = [.first, .second, .third, .fourth]
    }

    /// Returns true exactly if this Hanzi can be pronounced with the given tone (1...4).
    func hasTone(_ tone: Int) -> Bool {
        switch tone {
        case 1:
            return firstTone != nil
        case 2:
            return secondTone != nil
        case 3:
            return thirdTone != nil
        case 4:
            return fourthTone != nil
        default:
            fatalError("Invalid tone number: \(tone)")
        }
    }

    /// Returns the tones that this Hanzi has in common with the given tones (a set intersection).
    func sharedTones(tones: Tones) -> Tones {
        var sharedTones = tones
        for tone in 1...4 {
            if !hasTone(tone) {
                sharedTones.remove(Tones.singleTone(tone))
            }
        }
        return sharedTones
    }
    
    /// Returns true if this character has more than one pronunciation (i.e. it is a 破音字).
    var isJoker: Bool {
        return (1...4).filter { hasTone($0) }.count > 1
    }
}
