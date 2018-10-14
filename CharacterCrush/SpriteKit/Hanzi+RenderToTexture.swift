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

fileprivate let jokerTextAttributes: [NSAttributedString.Key: Any] = [
    .font: UIFont.systemFont(ofSize: hanziTextureSize * 0.75),
    .foregroundColor: UIColor.white,
    .shadow: jokerTextShadow,
]

extension Hanzi {
    
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

fileprivate let toneColors: [Hanzi.Tones: UIColor] = [
    .first:  UIColor(red: 227/255.0, green: 0, blue: 0, alpha: 1),
    .second: UIColor(red: 2/255.0, green: 179/255.0, blue: 28/255.0, alpha: 1),
    .third:  UIColor(red: 21/255.0, green: 16/255.0, blue: 240/255.0, alpha: 1),
    .fourth: UIColor(red: 137/255.0, green: 0, blue: 191/255.0, alpha: 1),
]

extension Hanzi.Tones {
    
    func matchingBackgroundTexture() -> SKTexture {
        if let texture = toneTextures[self] {
            return texture
        }
        
        var colors = [UIColor]()
        let allTones: [Hanzi.Tones] = [.first, .second, .third, .fourth]
        for tone in allTones {
            if self.contains(tone) {
                colors.append(toneColors[tone]!)
            }
        }
        
        let scale = 32
        
        let texture = renderToTexture(size: CGSize(width: 1, height: colors.count * scale)) {
            for index in 0..<colors.count {
                colors[index % colors.count].setFill()
                UIRectFill(CGRect(x: 0, y: index * scale, width: 1, height: scale))
            }
        }
        texture.filteringMode = .nearest
        return texture
    }

}
