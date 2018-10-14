//
//  GameViewController.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

let secondsPerGame = 120

class GameViewController: UIViewController, SKSceneDelegate {

    @IBOutlet weak var gameView: SKView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    // These need to be set externally before showing this view controller.
    var source: HanziSource!
    var level: HanziLevel!
    
    private let startTime = Date()
    private lazy var scene = GameScene(source: source, level: level, delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        levelLabel.text = "Level: \(source.title) \(level.title)"
        
        gameView.presentScene(scene)
        
        // Immediately update the remaining time label once.
        self.update(0, for: scene)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scene.optimize(forSize: gameView.bounds.size)
    }
    
    @IBAction func toggleMute(_ sender: Any) {
        scene.isMuted.toggle()
        navigationItem.rightBarButtonItem!.title = (scene.isMuted ? "🔇" : "🔈")
    }

    // MARK: - Score and time-out logic
    
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        let elapsedTime = Date().timeIntervalSince(startTime)
        let remainingSeconds = max(0, secondsPerGame - Int(elapsedTime))
        
        self.title = String(format: "Time: %02d:%02d", remainingSeconds / 60, remainingSeconds % 60)
        self.scoreLabel.text = "Score: \(self.scene.score)"

        if remainingSeconds == 0 {
            scene.isPaused = true
            showFinalScore()
        }
    }
    
    private func showFinalScore() {
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        
        let alertController = UIAlertController(title: "Game Over",
                                                message: "Time's up! Your score: \(self.scene.score). Not bad!",
                                                preferredStyle: .alert)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
