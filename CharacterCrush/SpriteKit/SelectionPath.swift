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
    private var possibleTones: (Bool, Bool, Bool, Bool, Bool)
    
    init(touch: UITouch, from coordinate: Coordinate, grid: TileGrid) {
        self.touch = touch
        self.grid = grid
        self.coordinates = [coordinate]

        let tones = grid[coordinate]!.hanzi.pinyinForTones
        self.possibleTones = (tones.0 != nil, tones.1 != nil, tones.2 != nil, tones.3 != nil, tones.4 != nil)

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
        
        let tones = grid[coordinate]!.hanzi.pinyinForTones
        let toneIntersection = (
            (possibleTones.0 && tones.0 != nil),
            (possibleTones.1 && tones.1 != nil),
            (possibleTones.2 && tones.2 != nil),
            (possibleTones.3 && tones.3 != nil),
            (possibleTones.4 && tones.4 != nil)
        )
        if toneIntersection == (false, false, false, false, false) {
            return
        }
        self.possibleTones = toneIntersection
        
        coordinates.append(coordinate)
        bezierPath.addLine(to: coordinate.toLocation())
        self.path = bezierPath.cgPath
    }
    
    func tryToClear() {
        guard coordinates.count >= 3 else { return }
        
        grid.removeTiles(at: self.coordinates)
    }
    
}
