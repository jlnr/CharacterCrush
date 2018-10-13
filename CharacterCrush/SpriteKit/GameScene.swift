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
    
    private let columns = 8
    private let rows = 9
    private let level: HanziLevel
    
    init(level: HanziLevel) {
        self.level = level
        super.init(size: CGSize(width: CGFloat(columns + 1) * HanziNode.size,
                                height: CGFloat(rows + 1) * HanziNode.size))
        
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
        floor.position = CGPoint(x: self.size.width / 2, y: 0)
        let floorSize = CGSize(width: self.size.width, height: HanziNode.size)
        floor.physicsBody = SKPhysicsBody(rectangleOf: floorSize)
        floor.physicsBody!.isDynamic = false
        floor.physicsBody!.categoryBitMask = Category.floor.rawValue
        addChild(floor)

        for x in 1...columns {
            for y in 1...rows {
                addHanzi(column: x, row: y)
            }
        }
    }
    
    func addHanzi(column: Int, row: Int) {
        let hanzi = level.characters.randomElement()!
        let node = HanziNode(hanzi: hanzi, column: column)

        let x = CGFloat(column) * HanziNode.size
        let y = CGFloat(row) * HanziNode.size
        node.position = CGPoint(x: x, y: y)

        addChild(node)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}

// MARK: - Touch handling

extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let nodes = self.nodes(at: touch.location(in: self))
            nodes.forEach {
                if let hanziNode = $0 as? HanziNode {
                    hanziNode.removeFromParent()
                    addHanzi(column: hanziNode.column, row: rows + 2)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
}
