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
    
    var score: Int {
        // This is 1 when the bare minimum was cleared, and more otherwise.
        let baseScore = coordinates.count - minimumLengthToClear + 1
        // 1, 3, 6, 10, 15 ...
        return baseScore * (baseScore + 1) / 2
    }
    
    private let grid: TileGrid
    private var coordinates: [Coordinate]
    
    init(touch: UITouch, from coordinate: Coordinate, grid: TileGrid) {
        self.touch = touch
        self.grid = grid
        self.coordinates = [coordinate]
    
        super.init()
        self.strokeColor = .white

        self.path = self.bezierPath.cgPath

        self.lineWidth = tileSize * 0.8
        self.lineCap = .round
        self.miterLimit = 2.0
        self.zPosition = -1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func extendOrBacktrack(to coordinate: Coordinate) {
        if coordinates.count > 1 && coordinates[coordinates.count - 2] == coordinate {
            backtrack()
        } else {
            tryToExtend(to: coordinate)
        }
    }
    
    private func tryToExtend(to coordinate: Coordinate) {
        guard coordinate.isWithinGrid,
            !coordinates.contains(coordinate),
            coordinate.isAdjacent(coordinates.last!) else { return }
        
        let sharedTones = grid[coordinate]!.hanzi.sharedTones(tones: self.possibleTones)
        if sharedTones == [] {
            return
        }
        
        coordinates.append(coordinate)
        self.path = self.bezierPath.cgPath
    }
    
    private func backtrack() {
        coordinates.removeLast()
        self.path = self.bezierPath.cgPath
    }
    
    func tryToClear() -> Bool {
        guard coordinates.count >= minimumLengthToClear else { return false }
        
        grid.removeTiles(at: self.coordinates)
        return true
    }
    
    private var possibleTones: Hanzi.Tones {
        var tones = Hanzi.Tones.all
        for coordinate in coordinates {
            tones = grid[coordinate]!.hanzi.sharedTones(tones: tones)
        }
        return tones
    }
    
    private var bezierPath: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: coordinates.first!.toLocation())
        for coordinate in coordinates.suffix(from: 1) {
            path.addLine(to: coordinate.toLocation())
        }
        return path
    }

}
