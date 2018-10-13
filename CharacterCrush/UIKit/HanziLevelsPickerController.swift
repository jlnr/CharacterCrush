//
//  HanziLevelsPickerController.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit

class HanziLevelsPickerController: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!

    private enum PickerComponent: Int, CaseIterable {
        case source, level
    }

    // TODO: Save and restore selected level from NSUserDefaults.
    private var selectedSource = 0
    
    var selectedLevel: HanziLevel {
        let level = pickerView.selectedRow(inComponent: PickerComponent.level.rawValue)
        return hanziSources[selectedSource].levels[level]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PickerComponent.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch PickerComponent(rawValue: component)! {
        case .source:
            return hanziSources.count
        case .level:
            return hanziSources[selectedSource].levels.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch PickerComponent(rawValue: component)! {
        case .source:
            return hanziSources[row].title
        case .level:
            return hanziSources[selectedSource].levels[row].title
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch PickerComponent(rawValue: component)! {
        case .source:
            selectedSource = row
            pickerView.reloadComponent(PickerComponent.level.rawValue)
        case .level:
            // TODO: Update live demo running in SKView above.
            break
        }
    }
    
}
