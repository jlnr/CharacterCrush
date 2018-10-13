//
//  HanziNode.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 11.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

class HanziNode: SKSpriteNode {

    init(hanzi: Hanzi) {
        super.init(texture: hanzi.asTexture(),
                   color: .clear,
                   size: CGSize(width: 1.0, height: 1.0))
        anchorPoint = CGPoint(x: 0, y: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
