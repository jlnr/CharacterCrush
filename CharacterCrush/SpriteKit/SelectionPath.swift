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
    private let grid: TileGrid
    private var coordinates: [Coordinate]
    private let bezierPath = UIBezierPath()
    
    init(touch: UITouch, from coordinate: Coordinate, grid: TileGrid) {
        self.touch = touch
        self.grid = grid
        self.coordinates = [coordinate]

        super.init()
        self.strokeColor = .white

        bezierPath.move(to: coordinate.toLocation())
        self.path = bezierPath.cgPath

        self.lineWidth = tileSize * 0.8
        self.lineCap = .round
        self.miterLimit = 2.0
        self.zPosition = -1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tryToAdd(coordinate: Coordinate) {
        guard coordinate.isWithinGrid,
            !coordinates.contains(coordinate),
            coordinate.isAdjacent(coordinates.last!) else { return }
        
        coordinates.append(coordinate)
        bezierPath.addLine(to: coordinate.toLocation())
        self.path = bezierPath.cgPath
    }
    
    func tryToClear() {
        guard coordinates.count >= 3 else { return }
        
        grid.removeTiles(at: self.coordinates)
    }
    
}
