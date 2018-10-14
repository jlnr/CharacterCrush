//
//  SelectionPath.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

// MARK: - SelectionPath logic

class SelectionPath: SKShapeNode {
    
    static let minimumLengthToClear = 2
    
    let touch: UITouch?

    var length: Int {
        return coordinates.count
    }
    
    private let grid: TileGrid
    private var coordinates: [Coordinate]
    
    init(touch: UITouch?, from coordinate: Coordinate, grid: TileGrid) {
        self.touch = touch
        self.grid = grid
        self.coordinates = [coordinate]
        grid[coordinate]!.isHighlighted = true
    
        super.init()

        self.zPosition = -1
        
        updateAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        for coordinate in self.coordinates {
            grid[coordinate]!.isHighlighted = false
        }
    }
    
    func tryToExtend(to coordinate: Coordinate) -> Bool {
        guard coordinate.isWithinGrid,
            !coordinates.contains(coordinate),
            coordinate.isAdjacent(coordinates.last!) else { return false }
        
        let sharedTones = grid[coordinate]!.hanzi.sharedTones(tones: self.possibleTones)
        if sharedTones == [] {
            return false
        }
        
        grid[coordinate]!.isHighlighted = true
        coordinates.append(coordinate)
        updateAppearance()
        return true
    }
    
    func tryToBacktrack(to coordinate: Coordinate) {
        guard coordinates.count > 1,
            coordinates[coordinates.count - 2] == coordinate else { return }
        
        grid[coordinates.last!]!.isHighlighted = false
        coordinates.removeLast()
        updateAppearance()
    }
    
    func tryToClear() -> Bool {
        guard coordinates.count >= SelectionPath.minimumLengthToClear else { return false }
        
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
        self.lineWidth = tileSize * 1.05
        if UIDevice.current.userInterfaceIdiom != .pad && coordinates.count == 1 {
             self.lineWidth = tileSize * 1.4
        }
        self.lineCap = .round
        self.lineJoin = .round
        self.strokeTexture = possibleTones.matchingBackgroundTexture()
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
