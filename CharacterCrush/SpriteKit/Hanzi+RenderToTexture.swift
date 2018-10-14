//
//  HanziRenderer.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit
import SpriteKit

fileprivate func renderToTexture(size: CGSize, block: () throws -> ()) rethrows -> SKTexture {
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    defer { UIGraphicsEndImageContext() }
    try block();
    return SKTexture(image: UIGraphicsGetImageFromCurrentImageContext()!)
}

fileprivate let hanziTextureSize: CGFloat = 64

fileprivate let textAttributes: [NSAttributedString.Key: Any] = [
    .font: UIFont.systemFont(ofSize: hanziTextureSize * 0.9),
    .foregroundColor: UIColor.white,
]

extension Hanzi {

    func asTexture() -> SKTexture {
        let size = CGSize(width: hanziTextureSize, height: hanziTextureSize)

        return renderToTexture(size: size) {
            let string = String(self.character) as NSString
            let size = string.boundingRect(with: size, attributes: textAttributes, context: nil).size
            let origin = CGPoint(x: (hanziTextureSize - size.width) / 2,
                                 y: (hanziTextureSize - size.height) / 2)
            string.draw(at: origin, withAttributes: textAttributes)
        }
    }
    
    fileprivate static let toneTextures = [Tones: SKTexture]()
    
    fileprivate static let toneColors: [Tones: UIColor] = [
        .first:  UIColor(red: 227/255.0, green: 0, blue: 0, alpha: 1),
        .second: UIColor(red: 2/255.0, green: 179/255.0, blue: 28/255.0, alpha: 1),
        .third:  UIColor(red: 21/255.0, green: 16/255.0, blue: 240/255.0, alpha: 1),
        .fourth: UIColor(red: 137/255.0, green: 0, blue: 191/255.0, alpha: 1),
    ]
    
    static func texture(forTones tones: Tones) -> SKTexture {
        if let texture = toneTextures[tones] {
            return texture
        }
        
        var colors = [UIColor]()
        for tone in [Tones.first, Tones.second, Tones.third, Tones.fourth] {
            if tones.contains(tone) {
                colors.append(toneColors[tone]!)
            }
        }
        
        let rows = 24
        
        let texture = renderToTexture(size: CGSize(width: 1, height: rows)) {
            for row in 0..<rows {
                colors[row % colors.count].setFill()
                UIRectFill(CGRect(x: 0, y: row, width: 1, height: 1))
            }
        }
        texture.filteringMode = .nearest
        return texture
    }
    
}
