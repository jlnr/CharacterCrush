//
//  HanziTile.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 11.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

/// Instances of this class represent a tile on the game board (`TileGrid`).
/// These tiles fall down based on SpriteKit's physics engine.
class HanziTile: SKSpriteNode {
    
    let hanzi: Hanzi
    
    /// Toggled when this tile enters of leaves a `SelectionPath`.
    var isHighlighted = false {
        didSet {
            updateBlendFactor()
        }
    }
    
    init(hanzi: Hanzi, at coordinate: Coordinate) {
        self.hanzi = hanzi
        
        // All tiles are rendered in white, but are usually blended with the color given here.
        // i.e. Joker tiles are usually yellow, and normal tiles are usually black.
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
        // When tiles are selected, discard the blend color, and let the original (white) color
        // shine through.
        self.colorBlendFactor = isHighlighted ? 0.0 : 1.0
    }
    
}
