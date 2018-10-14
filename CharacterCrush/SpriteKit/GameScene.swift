//
//  GameScene.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import SpriteKit
import AVKit

class GameScene: SKScene {
    
    private (set) var score = 0
    
    private let grid: TileGrid
    
    private var selectionPath: SelectionPath? {
        didSet {
            if let oldPath = oldValue {
                oldPath.removeFromParent()
            }
            if let newPath = selectionPath {
                addChild(newPath)
            }
        }
    }
    
    init(source: HanziSource, level: HanziLevel, delegate: SKSceneDelegate) {
        self.voice = AVSpeechSynthesisVoice(language: source.voiceLanguage)
        self.synthesizer = self.voice == nil ? nil : AVSpeechSynthesizer()
        
        self.grid = TileGrid(level: level)
        super.init(size: grid.size)
        addChild(grid)
        
        self.delegate = delegate

        scaleMode = .aspectFill
        backgroundColor = .white
        
        // Let tiles fall down faster.
        physicsWorld.gravity.dy *= 10
    }
    
    func optimize(forSize size: CGSize) {
        let viewAspectRatio = size.width / size.height
        let gridAspectRatio = grid.size.width / grid.size.height
        
        self.size = grid.size
        self.anchorPoint = .zero
        
        if viewAspectRatio > gridAspectRatio {
            // Make the scene wider to match view's aspect ratio.
            self.size.width *= (viewAspectRatio / gridAspectRatio)
            // Also adjust the anchor point to re-center the scene's contents.
            self.anchorPoint.x = (self.size.width - grid.size.width) / 2 / self.size.width
        } else {
            // Make the scene taller to match view's aspect ratio.
            self.size.height *= (gridAspectRatio / viewAspectRatio)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didFinishUpdate() {
        super.didFinishUpdate()
        physicsWorld.speed = grid.needsPhysics ? 1.0 : 0.0
    }
    
    // MARK: - Text-to-speech
    
    var isMuted = false
    
    private let synthesizer: AVSpeechSynthesizer?
    private let voice: AVSpeechSynthesisVoice?
    
    func pronounceCharacter(_ character: Character) {
        guard !isMuted, let synthesizer = synthesizer, !synthesizer.isSpeaking else { return }
        
        // Try speaking this character using Apple's text-to-speech engine.
        let utterance = AVSpeechUtterance(string: String(character))
        utterance.voice = voice
        synthesizer.speak(utterance)
    }
    
}

// MARK: - Touch handling

extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard selectionPath == nil else { return }
        
        for touch in touches {
            let coordinate = Coordinate(closestToLocation: touch.location(in: self))
            if coordinate.isWithinGrid {
                self.selectionPath = SelectionPath(touch: touch, from: coordinate, grid: grid)
                pronounceCharacter(grid[coordinate]!.hanzi.character)
                return
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let selectionPath = selectionPath else { return }
        
        let coordinate = Coordinate(closestToLocation: selectionPath.touch.location(in: self))
        if selectionPath.tryToExtend(to: coordinate) {
            pronounceCharacter(grid[coordinate]!.hanzi.character)
        } else {
            selectionPath.tryToBacktrack(to: coordinate)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let selectionPath = selectionPath else { return }
        
        if touches.contains(selectionPath.touch) {
            if selectionPath.tryToClear() {
                self.score += selectionPath.score
            }
            self.selectionPath = nil
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let selectionPath = selectionPath else { return }

        if touches.contains(selectionPath.touch) {
            self.selectionPath = nil
        }
    }
    
}
