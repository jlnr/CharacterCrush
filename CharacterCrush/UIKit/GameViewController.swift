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

class GameViewController: UIViewController {

    @IBOutlet weak var gameView: SKView!
    
    var level: HanziLevel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.presentScene(GameScene(level: level))
    }
    
}
