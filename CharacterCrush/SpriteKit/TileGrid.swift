//
//  TileGrid.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

class TileGrid: SKNode {
    
    private let nextTileGenerator: NextTileGenerator
    
    let size = CGSize(width: CGFloat(Coordinate.validColumns.count + 1) * tileSize,
                      height: CGFloat(Coordinate.validRows.count + 1) * tileSize)
    
    private var coordinateToTile = [Coordinate: HanziTile]()
    
    private var lastTileDroppedAt = Date()
    
    var needsPhysics: Bool {
        let maxTileDropTime: TimeInterval = 2.5
        return Date().timeIntervalSince(lastTileDroppedAt) < maxTileDropTime
    }
    
    init(nextTileGenerator: NextTileGenerator) {
        self.nextTileGenerator = nextTileGenerator
        
        super.init()
        
        let floor = SKNode()
        let floorFrom = CGPoint(x: 0, y: tileSize / 2)
        let floorTo = CGPoint(x: self.size.width, y: tileSize / 2)
        floor.physicsBody = SKPhysicsBody(edgeFrom: floorFrom, to: floorTo)
        floor.physicsBody!.categoryBitMask = Category.floor.rawValue
        addChild(floor)
        
        refillGrid()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private (set) subscript(coordinate: Coordinate) -> HanziTile? {
        get {
            return coordinateToTile[coordinate]
        }
        set(newValue) {
            coordinateToTile[coordinate] = newValue
        }
    }
    
    func removeTiles(at coordinates: [Coordinate]) {
        assert(coordinateToTile.count == Coordinate.validColumns.count * Coordinate.validRows.count,
               "TileGrid must be completely filled before removing tiles")
        
        for coordinate in coordinates {
            self[coordinate]!.removeFromParent()
            self[coordinate] = nil
        }
        updateCoordinates()
        refillGrid()
    }
    
    private func updateCoordinates() {
        for column in Coordinate.validColumns {
            for row in Coordinate.validRows {
                let coordinate = Coordinate(column: column, row: row)
                if self[coordinate] == nil {
                    self[coordinate] = popTile(above: coordinate)
                }
            }
        }
    }
    
    private func popTile(above coordinate: Coordinate) -> HanziTile? {
        guard coordinate.row < Coordinate.validRows.upperBound else { return nil }
        
        for row in (coordinate.row + 1)...Coordinate.validRows.upperBound {
            let coordinate = Coordinate(column: coordinate.column, row: row)
            if let tile = self[coordinate] {
                self[coordinate] = nil
                return tile
            }
        }
        return nil
    }
    
    private func refillGrid() {
        for column in Coordinate.validColumns {
            var newTilesInColumn = 0
            
            for row in Coordinate.validRows {
                let coordinate = Coordinate(column: column, row: row)
                if self[coordinate] == nil {
                    let rowAboveGrid = Coordinate.validRows.upperBound + 2 + newTilesInColumn
                    let dropCoordinate = Coordinate(column: column, row: rowAboveGrid)
                    self[coordinate] = addTile(dropFrom: dropCoordinate)
                    newTilesInColumn += 1
                }
            }
        }
    }
    
    private func addTile(dropFrom coordinate: Coordinate) -> HanziTile {
        lastTileDroppedAt = Date()
        
        let hanzi = nextTileGenerator.nextHanzi(at: coordinate)
        let tile = HanziTile(hanzi: hanzi, at: coordinate)
        addChild(tile)
        return tile
    }
    
}
