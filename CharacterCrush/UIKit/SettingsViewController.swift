//
//  SettingsViewController.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
}

// MARK: - Connect UIPicker to difficulty levels defined in HanziLevels.swift

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    enum PickerComponent: Int, CaseIterable {
        case source = 0, level
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
