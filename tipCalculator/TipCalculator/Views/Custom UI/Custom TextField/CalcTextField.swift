//
//  CalcTextField.swift
//  TipCalculator
//
//  Created by Bryan Workman on 7/6/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import UIKit

class CalcTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        setupPlaceholderText()
        updateFontTo(font: FontNames.latoRegular)
        self.addCornerRadius(radius: 10)
        self.addAccentBorder()
        self.textColor = .mainText
        self.backgroundColor = .lighterBlue
        self.layer.masksToBounds = true
    }
    
    func setupPlaceholderText() {
        let currentPlaceholder = self.placeholder
        self.attributedPlaceholder = NSAttributedString(string: currentPlaceholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.subtleText, NSAttributedString.Key.font: UIFont(name: FontNames.latoLight, size: 16)!])
    }
    
    func updateFontTo(font: String) {
        guard let size = self.font?.pointSize else {return}
        self.font = UIFont(name: font, size: size)
    }
    
}
