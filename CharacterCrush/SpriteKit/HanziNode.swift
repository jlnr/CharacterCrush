//
//  HanziNode.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 11.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

class HanziNode: SKSpriteNode {
    
    static let size: CGFloat = 1000
    
    private (set) var column: Int
    
    init(hanzi: Hanzi, column: Int) {
        assert(column >= 1, "Column numbering starts at 1")
        
        self.column = column
        
        super.init(texture: hanzi.asTexture(),
                   color: .clear,
                   size: CGSize(width: HanziNode.size, height: HanziNode.size))
        
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody!.allowsRotation = false
        self.physicsBody!.restitution = 0.5
        self.physicsBody!.categoryBitMask = Category.tiles(column: column).rawValue
        self.physicsBody!.collisionBitMask = Category.floorAndTiles(column: column).rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
