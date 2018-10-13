//
//  SettingsViewController.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var hanziLevelsPickerController: HanziLevelsPickerController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let gameViewController as GameViewController:
            gameViewController.level = hanziLevelsPickerController.selectedLevel
        default:
            super.prepare(for: segue, sender: sender)
        }
    }
    
}
