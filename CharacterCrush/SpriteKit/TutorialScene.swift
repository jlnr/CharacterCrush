//
//  TutorialScene.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 14.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

class TutorialScene: SKScene {
    
    private let grid: TileGrid
    
    private var selectionPath: SelectionPath? {
        didSet {
            if let oldPath = oldValue {
                oldPath.removeFromParent()
            }
            if let newPath = selectionPath {
                addChild(newPath)
            }
        }
    }
    
    init(level: HanziLevel) {
        self.grid = TileGrid(nextTileGenerator: NextTileGenerator(level: level, demoMode: true))
        super.init(size: grid.size)
        addChild(grid)
        
        scaleMode = .aspectFit
        backgroundColor = .white
        
        // Let tiles fall down faster.
        physicsWorld.gravity.dy *= 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didFinishUpdate() {
        super.didFinishUpdate()
        physicsWorld.speed = grid.needsPhysics ? 1.0 : 0.0

        if !grid.needsPhysics && selectionPath == nil {
            self.selectionPath = SelectionPath(touch: nil, from: Coordinate(column: 1, row: 5), grid: grid)
        }
    }
    
}
