//
//  SelectionPath.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit

/// Manages and displays the path of characters that the user has currently selected.
class SelectionPath: SKShapeNode {
    
    /// This is the minimum number of tiles that can be cleared in a row.
    static let minimumLengthToClear = 3
    
    /// The touch that started this `SelectionPath`.
    /// Used for deciding whether a touch operation should affect this path.
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
    
    /// Returns true if the given coordinate could be added to this path (and does so).
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
    
    /// Tries to backtrack to the given coordinate.
    func tryToBacktrack(to coordinate: Coordinate) {
        guard coordinates.count > 1,
            coordinates[coordinates.count - 2] == coordinate else { return }
        
        grid[coordinates.last!]!.isHighlighted = false
        coordinates.removeLast()
        updateAppearance()
    }
    
    /// Returns true if the current path can be cleared (and does so).
    func tryToClear() -> Bool {
        guard coordinates.count >= SelectionPath.minimumLengthToClear else { return false }
        
        grid.removeTiles(at: self.coordinates)
        return true
    }
    
    /// The intersection of the possible tones of each character in this path.
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
        (self.strokeColor, self.strokeTexture) = possibleTones.matchingBackground()
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
