//
//  SelectionPath.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

let minimumLengthToClear = 2

class SelectionPath: SKShapeNode {
    
    let touch: UITouch
    
    private let grid: TileGrid
    private var coordinates: [Coordinate]
    private var possibleTones: Hanzi.Tones
    private let bezierPath = UIBezierPath()
    
    init(touch: UITouch, from coordinate: Coordinate, grid: TileGrid) {
        self.touch = touch
        self.grid = grid
        self.coordinates = [coordinate]
        self.possibleTones = grid[coordinate]!.hanzi.sharedTones(tones: .all)

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
        
        let sharedTones = grid[coordinate]!.hanzi.sharedTones(tones: self.possibleTones)
        if sharedTones == [] {
            return
        }
        self.possibleTones = sharedTones
        
        coordinates.append(coordinate)
        bezierPath.addLine(to: coordinate.toLocation())
        self.path = bezierPath.cgPath
    }
    
    func tryToClear() -> Bool {
        guard coordinates.count >= minimumLengthToClear else { return false }
        
        grid.removeTiles(at: self.coordinates)
        return true
    }
    
    var score: Int {
        // This is 1 when the bare minimum was cleared, and more otherwise.
        let baseScore = coordinates.count - minimumLengthToClear + 1
        // 1, 3, 6, 10, 15 ...
        return baseScore * (baseScore + 1) / 2
    }
    
}
