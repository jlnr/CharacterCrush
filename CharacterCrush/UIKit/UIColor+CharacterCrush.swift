//
//  UIColor+CharacterCrush.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(rgb: Int) {
        let red   = CGFloat((rgb >> 16) & 0xff) / 255.0
        let green = CGFloat((rgb >> 8)  & 0xff) / 255.0
        let blue  = CGFloat((rgb >> 0)  & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    class var brandGreen: UIColor {
        return UIColor(rgb: 0x64c701)
    }
    
    class var brandRed: UIColor {
        return UIColor(rgb: 0xc80000)
    }
    
    func darkened() -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return UIColor(hue: hue, saturation: saturation * 1.5, brightness: brightness * 0.7, alpha: alpha)
    }
    
}
