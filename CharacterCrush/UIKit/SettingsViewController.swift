//
//  SettingsViewController.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit
import SpriteKit

/// This view controller displays a demo/tutorial, and lets the user pick a difficulty level before
/// starting a game.
class SettingsViewController: UIViewController, HanziLevelsPickerControllerDelegate {
    
    @IBOutlet weak var tutorialView: SKView!
    @IBOutlet var hanziLevelsPickerController: HanziLevelsPickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedLevelDidChange()
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

    func selectedLevelDidChange() {
        let level = hanziLevelsPickerController.selectedLevel
        tutorialView.presentScene(TutorialScene(level: level))
    }
    
}
