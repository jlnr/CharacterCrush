//
//  GameScene.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private (set) var score = 0
    
    private let grid: TileGrid
    
    private var selectionPath: SelectionPath? {
        didSet {
            if let oldPath = oldValue {
                oldPath.removeFromParent()
            }
            if let newPath = selectionPath {
                self.addChild(newPath)
            }
        }
    }
    
    init(level: HanziLevel, delegate: SKSceneDelegate) {
        self.grid = TileGrid(level: level)
        super.init(size: grid.size)
        addChild(grid)

        self.delegate = delegate

        scaleMode = .aspectFit
        
        // Let tiles fall down faster.
        physicsWorld.gravity.dy *= 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Touch handling

extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard selectionPath == nil else { return }
        
        for touch in touches {
            let coordinate = Coordinate(closestToLocation: touch.location(in: self))
            if coordinate.isWithinGrid {
                self.selectionPath = SelectionPath(touch: touch, from: coordinate, grid: grid)
                return
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let selectionPath = selectionPath else { return }
        
        let coordinate = Coordinate(closestToLocation: selectionPath.touch.location(in: self))
        selectionPath.tryToAdd(coordinate: coordinate)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let selectionPath = selectionPath else { return }
        
        if touches.contains(selectionPath.touch) {
            if selectionPath.tryToClear() {
                self.score += selectionPath.score
            }
            self.selectionPath = nil
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let selectionPath = selectionPath else { return }

        if touches.contains(selectionPath.touch) {
            self.selectionPath = nil
        }
    }
    
}
