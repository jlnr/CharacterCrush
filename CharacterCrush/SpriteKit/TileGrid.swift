//
//  TileGrid.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

class TileGrid: SKNode {
    
    let level: HanziLevel
    
    let size = CGSize(width: CGFloat(Coordinate.validColumns.count + 1) * tileSize,
                      height: CGFloat(Coordinate.validRows.count + 1) * tileSize)
    
    init(level: HanziLevel) {
        self.level = level
        
        super.init()
        
        let floor = SKNode()
        let floorFrom = CGPoint(x: 0, y: tileSize / 2)
        let floorTo = CGPoint(x: self.size.width, y: tileSize / 2)
        floor.physicsBody = SKPhysicsBody(edgeFrom: floorFrom, to: floorTo)
        floor.physicsBody!.categoryBitMask = Category.floor.rawValue
        addChild(floor)
        
        for column in Coordinate.validColumns {
            for row in Coordinate.validRows {
                addTile(at: Coordinate(column: column, row: row))
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTile(at coordinate: Coordinate) {
        let hanzi = level.characters.randomElement()!
        addChild(HanziNode(hanzi: hanzi, at: coordinate))
    }
    
    func removeTiles(coordinates: [Coordinate]) {
        var tilesPerColumn = [Int: Int]()
        
        for coordinate in coordinates {
            for node in self.nodes(at: coordinate.toLocation()) {
                if let hanziNode = node as? HanziNode {
                    hanziNode.removeFromParent()
                    let column = coordinate.column
                    tilesPerColumn[column] = (tilesPerColumn[column] ?? 0) + 1
                    let row = Coordinate.validRows.upperBound + 1 + tilesPerColumn[column]!
                    addTile(at: Coordinate(column: column, row: row))
                }
            }
        }

    }
    
}
