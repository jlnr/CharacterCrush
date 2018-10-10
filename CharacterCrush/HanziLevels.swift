//
//  HanziLevels.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import Foundation

struct HanziLevel {
    let title: String
    let characters: [Hanzi]
}

let hskLevels = [
    HanziLevel(title: "1", characters: hsk1),
    HanziLevel(title: "2", characters: hsk2),
    HanziLevel(title: "3", characters: hsk3),
    HanziLevel(title: "4", characters: hsk4),
    HanziLevel(title: "5", characters: hsk5),
    HanziLevel(title: "6", characters: hsk6),
]

let tocflLevels = [
    HanziLevel(title: "入門級", characters: tocfl1),
    HanziLevel(title: "基礎級", characters: tocfl2),
    HanziLevel(title: "進階級", characters: tocfl3),
    HanziLevel(title: "高階級", characters: tocfl4),
    HanziLevel(title: "流利級", characters: tocfl5),
]

struct HanziSource {
    let title: String
    let levels: [HanziLevel]
}

let hanziSources = [
    HanziSource(title: "HSK", levels: hskLevels),
    HanziSource(title: "TOCFL", levels: tocflLevels),
]
