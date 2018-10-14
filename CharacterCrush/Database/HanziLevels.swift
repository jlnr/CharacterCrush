//
//  HanziLevels.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

struct HanziLevel {
    let title: String
    let characters: [Hanzi]
}

fileprivate func weightedLevels(_ levels: [Hanzi]...) -> [Hanzi] {
    var result = [Hanzi]()
    for (index, level) in levels.reversed().enumerated() {
        for _ in 0...index {
            result += level
        }
    }
    return result
}

fileprivate let hskLevels = [
    HanziLevel(title: "1", characters: weightedLevels(hsk1)),
    HanziLevel(title: "2", characters: weightedLevels(hsk1, hsk2)),
    HanziLevel(title: "3", characters: weightedLevels(hsk1, hsk2, hsk3)),
    HanziLevel(title: "4", characters: weightedLevels(hsk1, hsk2, hsk3, hsk4)),
    HanziLevel(title: "5", characters: weightedLevels(hsk1, hsk2, hsk3, hsk4, hsk5)),
    HanziLevel(title: "6", characters: weightedLevels(hsk1, hsk2, hsk3, hsk4, hsk5, hsk6)),
]

fileprivate let tocflLevel = [
    HanziLevel(title: "入門級", characters: weightedLevels(tocfl1)),
    HanziLevel(title: "基礎級", characters: weightedLevels(tocfl1, tocfl2)),
    HanziLevel(title: "進階級", characters: weightedLevels(tocfl1, tocfl2, tocfl3)),
    HanziLevel(title: "高階級", characters: weightedLevels(tocfl1, tocfl2, tocfl3, tocfl4)),
    HanziLevel(title: "流利級", characters: weightedLevels(tocfl1, tocfl2, tocfl3, tocfl4, tocfl5)),
]

struct HanziSource {
    let title: String
    let levels: [HanziLevel]
}

let hanziSources = [
    HanziSource(title: "HSK", levels: hskLevels),
    HanziSource(title: "TOCFL", levels: tocflLevel),
]
