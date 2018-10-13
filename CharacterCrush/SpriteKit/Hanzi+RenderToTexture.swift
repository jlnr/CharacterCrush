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
    .foregroundColor: UIColor.black,
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
    
}
