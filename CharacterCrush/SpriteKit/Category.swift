//
//  Category.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

/// This OptionSet represents the categories of `SKPhysicsBody` that is used in this game.
struct Category: OptionSet {
    
    let rawValue: UInt32
    
    /// The category of the thin line at the bottom of the `TileGrid`, which prevents tiles from
    /// falling off the screen.
    static let floor = Category(rawValue: 1 << 0)
    
    /// Used by `HanziTile` to ensure that only tiles within the same column interact.
    /// This prevents friction between tiles from adjacent columns.
    static func tiles(column: Int) -> Category {
        assert(column >= 1, "Column numbering starts at 1")
        assert(column < 32, "SpriteKit only supports 32 categories")
        return Category(rawValue: 1 << column)
    }
    
    static func floorAndTiles(column: Int) -> Category {
        return [floor, tiles(column: column)]
    }
    
}
