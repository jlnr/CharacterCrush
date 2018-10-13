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
    
    private let level: HanziLevel

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
    
    init(level: HanziLevel) {
        self.level = level
        let width = CGFloat(Coordinate.validColumns.count + 1) * tileSize
        let height = CGFloat(Coordinate.validRows.count + 1) * tileSize
        super.init(size: CGSize(width: width, height: height))
        
        scaleMode = .aspectFit
        
        // Let tiles fall down faster.
        physicsWorld.gravity.dy *= 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        guard children.isEmpty else { return }
        
        let floor = SKNode()
        let floorFrom = CGPoint(x: 0, y: tileSize / 2)
        let floorTo = CGPoint(x: self.size.width, y: tileSize / 2)
        floor.physicsBody = SKPhysicsBody(edgeFrom: floorFrom, to: floorTo)
        floor.physicsBody!.categoryBitMask = Category.floor.rawValue
        addChild(floor)

        for column in Coordinate.validColumns {
            for row in Coordinate.validRows {
                addHanzi(coordinate: Coordinate(column: column, row: row))
            }
        }
    }
    
    func addHanzi(coordinate: Coordinate) {
        let hanzi = level.characters.randomElement()!
        addChild(HanziNode(hanzi: hanzi, coordinate: coordinate))
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}

// MARK: - Touch handling

extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard selectionPath == nil else { return }
        
        for touch in touches {
            let coordinate = Coordinate(closestToLocation: touch.location(in: self))
            if coordinate.isValid {
                self.selectionPath = SelectionPath(touch: touch, coordinate: coordinate)
                return
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let selectionPath = selectionPath else { return }
        
        let coordinate = Coordinate(closestToLocation: selectionPath.touch.location(in: self))
        if coordinate.isValid && !selectionPath.coordinates.contains(coordinate) {
            selectionPath.add(coordinate: coordinate)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let selectionPath = selectionPath else { return }
        
        var tilesPerColumn = [Int: Int]()
        
        if touches.contains(selectionPath.touch) {
            selectionPath.coordinates.forEach {
                self.nodes(at: $0.toLocation()).forEach {
                    if let hanziNode = $0 as? HanziNode {
                        hanziNode.removeFromParent()
                        let column = hanziNode.coordinate.column
                        tilesPerColumn[column] = (tilesPerColumn[column] ?? 0) + 1
                        let row = Coordinate.validRows.upperBound + 1 + tilesPerColumn[column]!
                        addHanzi(coordinate: Coordinate(column: column, row: row))
                    }
                }
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
