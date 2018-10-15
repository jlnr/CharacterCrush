//
//  HanziLevels.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

/// Defines a difficulty level within a `HanziSource` (see below).
struct HanziLevel {
    let title: String
    let characters: [Hanzi]
}

/// Returns an array that contains some of the items in the given arrays several times.
/// For example, given [hsk1, hsk2, hsk3], returns (hsk1 + hsk1 + hsk1) + (hsk2 + hsk2) + hsk3.
/// Without this weightin, the hsk1 characters would be hopelessly outnumbered by the hsk3 ones.
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

/// Defines a source of difficulty levels, each containing a variety of characters.
struct HanziSource {
    let title: String
    let voiceLanguage: String
    let levels: [HanziLevel]
}

/// Defines the two available sources of character sets, HSK (PRC) and TOCFL (ROC/Taiwan).
let hanziSources = [
    HanziSource(title: "HSK", voiceLanguage: "zh-CN", levels: hskLevels),
    HanziSource(title: "TOCFL", voiceLanguage: "zh-TW", levels: tocflLevel),
]
