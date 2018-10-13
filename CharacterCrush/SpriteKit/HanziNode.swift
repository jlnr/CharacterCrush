//
//  HanziNode.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 11.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

class HanziNode: SKSpriteNode {
    
    private (set) var coordinate: Coordinate
    
    init(hanzi: Hanzi, coordinate: Coordinate) {
        self.coordinate = coordinate
        
        super.init(texture: hanzi.asTexture(), color: .clear,
                   size: CGSize(width: tileSize, height: tileSize))

        self.position = coordinate.toLocation()

        let body = SKPhysicsBody(rectangleOf: self.size)
        body.allowsRotation = false
        body.restitution = 0.5
        body.categoryBitMask = Category.tiles(column: coordinate.column).rawValue
        body.collisionBitMask = Category.floorAndTiles(column: coordinate.column).rawValue
        self.physicsBody = body
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
