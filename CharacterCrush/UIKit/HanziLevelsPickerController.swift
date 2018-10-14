//
//  HanziLevelsPickerController.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit

@objc protocol HanziLevelsPickerControllerDelegate: class {
    
    func selectedLevelDidChange()
    
}

class HanziLevelsPickerController: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var delegate: HanziLevelsPickerControllerDelegate!
    @IBOutlet weak var pickerView: UIPickerView!

    private enum PickerComponent: Int, CaseIterable {
        case source, level
    }

    var selectedSource = hanziSources[0]
    
    var selectedLevel: HanziLevel {
        let level = pickerView.selectedRow(inComponent: PickerComponent.level.rawValue)
        return selectedSource.levels[level]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PickerComponent.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch PickerComponent(rawValue: component)! {
        case .source:
            return hanziSources.count
        case .level:
            return selectedSource.levels.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch PickerComponent(rawValue: component)! {
        case .source:
            return hanziSources[row].title
        case .level:
            return selectedSource.levels[row].title
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch PickerComponent(rawValue: component)! {
        case .source:
            selectedSource = hanziSources[row]
            pickerView.reloadComponent(PickerComponent.level.rawValue)
        case .level:
            // TODO: Update live demo running in SKView above.
            break
        }

        delegate.selectedLevelDidChange()
    }
    
}
