//
//  HanziTile.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 11.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

class HanziTile: SKSpriteNode {
    
    let hanzi: Hanzi
    
    var isHighlighted = false {
        didSet {
            updateBlendFactor()
        }
    }
    
    init(hanzi: Hanzi, at coordinate: Coordinate) {
        self.hanzi = hanzi
        
        super.init(texture: hanzi.asTexture(), color: (hanzi.isJoker ? .yellow : .black),
                   size: CGSize(width: tileSize, height: tileSize))
        updateBlendFactor()

        self.position = coordinate.toLocation()

        let body = SKPhysicsBody(rectangleOf: self.size)
        body.allowsRotation = false
        body.restitution = 0
        body.categoryBitMask = Category.tiles(column: coordinate.column).rawValue
        body.collisionBitMask = Category.floorAndTiles(column: coordinate.column).rawValue
        // Let each tile spawn with a different vertical velocity, to let them all fall down
        // nicely in the beginning of the game.
        body.velocity =  CGVector(dx: 0, dy: Double.random(in: -10000...0))
        self.physicsBody = body
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateBlendFactor() {
        self.colorBlendFactor = isHighlighted ? 0.0 : 1.0
    }
    
}
