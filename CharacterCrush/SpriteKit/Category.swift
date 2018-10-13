//
//  Category.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

struct Category: OptionSet {
    
    let rawValue: UInt32
    
    static let floor = Category(rawValue: 1 << 0)
    
    static func tiles(column: Int) -> Category {
        assert(column >= 1, "Column numbering starts at 1")
        return Category(rawValue: 1 << column)
    }
    
    static func floorAndTiles(column: Int) -> Category {
        return [floor, tiles(column: column)]
    }
    
}
