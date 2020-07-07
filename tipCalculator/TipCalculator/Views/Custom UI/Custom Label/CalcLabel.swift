//
//  CalcLabel.swift
//  TipCalculator
//
//  Created by Bryan Workman on 7/6/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import UIKit

class CalcLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateFontTo(font: FontNames.latoRegular)
        self.textColor = .mainText
    }
    
    func updateFontTo(font: String) {
        let size = self.font.pointSize
        self.font = UIFont(name: font, size: size)
    }
}

class CalcLabelLight: CalcLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
            updateFontTo(font: FontNames.latoLight)
    }
}

class CalcLabelBold: CalcLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        updateFontTo(font: FontNames.latoBold)
    }
}
