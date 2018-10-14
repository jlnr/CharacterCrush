//
//  NextTileGenerator.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 14.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import Foundation

class NextTileGenerator {
    
    private let level: HanziLevel
    
    private let demoMode: Bool
    private var nextTones = [Int: Int]()
    
    init(level: HanziLevel, demoMode: Bool) {
        self.level = level
        self.demoMode = demoMode
        for column in Coordinate.validColumns {
            // Start the first row with tones 1, 2, 1, 2, ...
            self.nextTones[column] = (column / 2 % 2) + 1
        }
    }
    
    func nextHanzi(at coordinate: Coordinate) -> Hanzi {
        var hanzi = level.characters.randomElement()!
        if demoMode {
            let tone = nextTones[coordinate.column]!
            nextTones[coordinate.column]! = tone % 4 + 1
            while !hanzi.hasTone(tone) {
                hanzi = level.characters.randomElement()!
            }
        }
        return hanzi
    }
    
}
