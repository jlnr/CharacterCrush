//
//  SettingsViewController.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit
import SpriteKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tutorialView: SKView!
    @IBOutlet var hanziLevelsPickerController: HanziLevelsPickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let level = hanziLevelsPickerController.selectedLevel
        tutorialView.presentScene(TutorialScene(level: level))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let gameViewController as GameViewController:
            gameViewController.source = hanziLevelsPickerController.selectedSource
            gameViewController.level = hanziLevelsPickerController.selectedLevel
        default:
            super.prepare(for: segue, sender: sender)
        }
    }
    
}
