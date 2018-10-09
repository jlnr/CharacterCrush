//
//  PrettyButton.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 09.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit

@IBDesignable
class PrettyButton: UIButton {
    
    @IBInspectable
    public var isPrimary: Bool = false {
        didSet {
            makePretty()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            updatePrettyColors()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makePretty()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makePretty()
    }
    
    override func prepareForInterfaceBuilder() {
        makePretty()
    }
    
    func makePretty() {
        titleLabel!.font = UIFont.preferredFont(forTextStyle: .headline)

        layer.borderColor = UIColor.brandGreen.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 15

        updatePrettyColors()
    }
    
    func updatePrettyColors() {
        tintColor = isPrimary ? .white : .brandGreen
        backgroundColor = isPrimary ? .brandGreen : .white
        if isHighlighted {
            tintColor = tintColor!.darkened()
            backgroundColor = backgroundColor!.darkened()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let normalSize = super.intrinsicContentSize
        return CGSize(width: normalSize.width, height: normalSize.height + 20)
    }
    
}
