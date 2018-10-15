//
//  Coordinate.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit

/// A coordinate represents the position of a tile within the `TileGrid`.
struct Coordinate: Equatable, Hashable {
    let column: Int
    let row: Int
    
    func isAdjacent(_ coordinate: Coordinate) -> Bool {
        return abs(row - coordinate.row) <= 1 && abs(column - coordinate.column) <= 1
    }
}

// MARK: - Valid and invalid coordinates

extension Coordinate {
    static let validColumns = 1...7
    static let validRows = 1...10
    
    var isWithinGrid: Bool {
        return Coordinate.validColumns.contains(column) && Coordinate.validRows.contains(row)
    }
}

// MARK: - Converting between coordinates and locations within TileGrid

let tileSize: CGFloat = 1000

extension Coordinate {
    init(closestToLocation location: CGPoint) {
        let column = Int(location.x / tileSize + 0.5)
        let row = Int(location.y / tileSize + 0.5)
        self.init(column: column, row: row)
    }
    
    func toLocation() -> CGPoint {
        return CGPoint(x: CGFloat(column) * tileSize, y: CGFloat(row) * tileSize)
    }
}
