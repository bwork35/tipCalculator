//
//  StyleGuide.swift
//  TipCalculator
//
//  Created by Bryan Workman on 7/6/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import UIKit

struct FontNames {
    static let latoBold = "Lato-Bold"
    static let latoRegular = "Lato-Regular"
    static let latoLight = "Lato-Light"
}

extension UIColor {
    static let borderHighlight = UIColor(named: "borderHighlight")!
    static let brickAccent = UIColor(named: "brickAccent")!
    static let darkerBlue = UIColor(named: "darkerBlue")!
    static let lighterBlue = UIColor(named: "lighterBlue")!
    static let mainText = UIColor(named: "mainText")!
    static let redAccent = UIColor(named: "redAccent")!
    static let yellowAccent = UIColor(named: "yellowAccent")!
    static let subtleText = UIColor(named: "subtleText")!
}

extension UIView {
    
    func addCornerRadius(radius: CGFloat = 4) {
        self.layer.cornerRadius = radius
    }
    
    func addAccentBorder(width: CGFloat = 1, color: UIColor = .borderHighlight) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
