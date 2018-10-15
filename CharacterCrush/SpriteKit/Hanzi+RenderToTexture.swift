//
//  HanziRenderer.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 13.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit
import SpriteKit

/// Returns the contents of the given block as an SKTexture.
fileprivate func renderToTexture(size: CGSize, block: () throws -> ()) rethrows -> SKTexture {
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    defer { UIGraphicsEndImageContext() }
    try block();
    return SKTexture(image: UIGraphicsGetImageFromCurrentImageContext()!)
}

fileprivate let hanziTextureSize: CGFloat = 64

/// Text attributes for normal tiles.
fileprivate let textAttributes: [NSAttributedString.Key: Any] = [
    .font: UIFont.systemFont(ofSize: hanziTextureSize * 0.75),
    .foregroundColor: UIColor.white,
]

fileprivate let jokerTextShadow: NSShadow = {
    let shadow = NSShadow()
    shadow.shadowBlurRadius = 4
    shadow.shadowColor = UIColor.black
    shadow.shadowOffset = CGSize(width: 0, height: 1)
    return shadow
}()

/// Text attributes for "joker tiles" (破音字).
fileprivate let jokerTextAttributes: [NSAttributedString.Key: Any] = [
    .font: UIFont.systemFont(ofSize: hanziTextureSize * 0.75),
    .foregroundColor: UIColor.white,
    .shadow: jokerTextShadow,
]

extension Hanzi {

    /// Returns an `SKTexture` that contains this character.
    func asTexture() -> SKTexture {
        let size = CGSize(width: hanziTextureSize, height: hanziTextureSize)
        
        return renderToTexture(size: size) {
            let string = String(self.character) as NSString
            let attributes = isJoker ? jokerTextAttributes : textAttributes
            let size = string.boundingRect(with: size, attributes: attributes, context: nil).size
            let origin = CGPoint(x: (hanziTextureSize - size.width) / 2,
                                 y: (hanziTextureSize - size.height) / 2)
            string.draw(at: origin, withAttributes: attributes)
        }
    }
    
}

fileprivate let toneTextures = [Hanzi.Tones: SKTexture]()

/// Tone colors based on Pleco's color scheme, but it should be great to let the user pick their
/// favorite color scheme in `SettingsViewController`.
fileprivate let toneColors: [Hanzi.Tones: UIColor] = [
    .first:  UIColor(rgb: 0xe30000),
    .second: UIColor(rgb: 0x02b31c),
    .third:  UIColor(rgb: 0x1510f0),
    .fourth: UIColor(rgb: 0x8900bf),
]

extension Hanzi.Tones {
    
    /// Returns a color, and (if applicable) a texture that can be used to indicate the valid tones
    /// for extending a `SelectionPath`.
    /// The reason that this method does not always return an `SKTexture` is that
    /// `SKShapeNode.strokeTexture` is buggy in the iOS simulator because it uses metal, and also
    /// returning a color is easy and makes debugging easier except for "joker tiles".
    func matchingBackground() -> (UIColor, SKTexture?) {
        var colors = [UIColor]()
        let allTones: [Hanzi.Tones] = [.first, .second, .third, .fourth]
        for tone in allTones {
            if self.contains(tone) {
                colors.append(toneColors[tone]!)
            }
        }
        
        if colors.count == 1 {
            return (colors.first!, nil)
        }
        
        if let texture = toneTextures[self] {
            return (.white, texture)
        }
        
        let scale = 32
        
        let texture = renderToTexture(size: CGSize(width: 1, height: colors.count * scale)) {
            for index in 0..<colors.count {
                colors[index % colors.count].setFill()
                UIRectFill(CGRect(x: 0, y: index * scale, width: 1, height: scale))
            }
        }
        texture.filteringMode = .nearest
        return (.white, texture)
    }

}
