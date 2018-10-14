//
//  SelectionPath.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

let minimumLengthToClear = 2

// MARK: - SelectionPath logic

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

        self.zPosition = -1
        
        updateAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tryToExtend(to coordinate: Coordinate) -> Bool {
        guard coordinate.isWithinGrid,
            !coordinates.contains(coordinate),
            coordinate.isAdjacent(coordinates.last!) else { return false }
        
        let sharedTones = grid[coordinate]!.hanzi.sharedTones(tones: self.possibleTones)
        if sharedTones == [] {
            return false
        }
        
        coordinates.append(coordinate)
        updateAppearance()
        return true
    }
    
    func tryToBacktrack(to coordinate: Coordinate) {
        guard coordinates.count > 1,
            coordinates[coordinates.count - 2] == coordinate else { return }
        
        coordinates.removeLast()
        updateAppearance()
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
}

// MARK: - SelectionPath appearance

extension SelectionPath {
    
    private func updateAppearance() {
        self.lineWidth = coordinates.count == 1 ? tileSize * 1.5 : tileSize * 0.8
        self.lineCap = .round
        self.miterLimit = 2.0
        self.strokeTexture = Hanzi.texture(forTones: possibleTones)
        updateBezierPath()
    }
    
    private func updateBezierPath() {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: coordinates.first!.toLocation())
        for coordinate in coordinates.suffix(from: 1) {
            bezierPath.addLine(to: coordinate.toLocation())
        }
        self.path = bezierPath.cgPath
    }
    
}
