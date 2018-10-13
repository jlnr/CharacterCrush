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
    
    let columns = 8
    let rows = 9
    
    override init() {
        let size = CGSize(width: columns, height: rows)
        super.init(size: size)
        
        scaleMode = .aspectFit
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        guard children.isEmpty else { return }
        
        let dummyHanzi = Hanzi(character: "瓜", pinyinForTones: (nil, nil, nil, nil, nil))
        
        for x in 0..<columns {
            for y in 0..<rows {
                let node = HanziNode(hanzi: dummyHanzi)
                node.position = CGPoint(x: x, y: y)
                addChild(node)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
