//
//  CalcButton.swift
//  TipCalculator
//
//  Created by Bryan Workman on 7/6/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import UIKit

class CalcButton: UIButton {
    
    override func awakeFromNib() {
         super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        updateFontTo(font: FontNames.latoRegular)
        self.setTitleColor(.mainText, for: .normal)
        self.backgroundColor = .redAccent
        self.addCornerRadius()
    }
    
    func updateFontTo(font: String) {
        guard let size = self.titleLabel?.font.pointSize else {return}
        self.titleLabel?.font = UIFont(name: font, size: size)
    }
    
}

class CalcButtonDark: CalcButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .brickAccent
    }
    
}
