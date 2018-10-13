//
//  SettingsViewController.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let gameViewController as GameViewController:
            gameViewController.level = self.selectedLevel
        default:
            super.prepare(for: segue, sender: sender)
        }
    }
    
}

// MARK: - Connect UIPicker to difficulty levels defined in HanziLevels.swift

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    private enum PickerComponent: Int, CaseIterable {
        case source = 0, level
    }
    
    private var selectedLevel: HanziLevel {
        let source = pickerView.selectedRow(inComponent: PickerComponent.source.rawValue)
        let level  = pickerView.selectedRow(inComponent: PickerComponent.level.rawValue)
        return hanziSources[source].levels[level]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PickerComponent.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch PickerComponent(rawValue: component)! {
        case .source:
            return hanziSources.count
        case .level:
            let source = pickerView.selectedRow(inComponent: PickerComponent.source.rawValue)
            return hanziSources[source].levels.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch PickerComponent(rawValue: component)! {
        case .source:
            return hanziSources[row].title
        case .level:
            let source = pickerView.selectedRow(inComponent: PickerComponent.source.rawValue)
            return hanziSources[source].levels[row].title
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch PickerComponent(rawValue: component)! {
        case .source:
            pickerView.reloadComponent(PickerComponent.level.rawValue)
        case .level:
            // TODO: Update live demo running in SKView above.
            break
        }
    }
    
}
