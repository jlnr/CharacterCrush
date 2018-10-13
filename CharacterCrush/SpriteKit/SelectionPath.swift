//
//  SelectionPath.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

class SelectionPath: SKShapeNode {
    
    let touch: UITouch
    private (set) var coordinates = [Coordinate]()
    
    init(touch: UITouch, coordinate: Coordinate) {
        self.touch = touch
        super.init()
        self.strokeColor = .white
        add(coordinate: coordinate)
        self.lineWidth = tileSize * 0.8
        self.lineCap = .round
        self.miterLimit = 2.0
        self.zPosition = -1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func add(coordinate: Coordinate) {
        coordinates.append(coordinate)
        updatePath()
    }
    
    private func updatePath() {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: coordinates[0].toLocation())
        coordinates.forEach { bezierPath.addLine(to: $0.toLocation()) }
        self.path = bezierPath.cgPath
    }
    
}
