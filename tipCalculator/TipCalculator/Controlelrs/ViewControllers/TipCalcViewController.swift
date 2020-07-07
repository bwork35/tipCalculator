//
//  TipCalcViewController.swift
//  TipCalculator
//
//  Created by Bryan Workman on 7/6/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import UIKit

class TipCalcViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var billTotalLabel: UILabel!
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var tenPercentLabel: UIButton!
    @IBOutlet weak var fifteenPercentLabel: UIButton!
    @IBOutlet weak var eighteenPercentLabel: UIButton!
    @IBOutlet weak var twentyPercentLabel: UIButton!
    @IBOutlet weak var customTipLabel: UILabel!
    @IBOutlet weak var customTipTextField: UITextField!
    @IBOutlet weak var calculateButtonLabel: UIButton!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var roundUpButtonLabel: UIButton!
    @IBOutlet weak var roundDownButtonLabel: UIButton!

    
    //MARK: - Properties
    var tipPercent = 0
    var finalTip: Double = 0.00
    var finalTotal: Double = 0.00
    var viewsLaidOut = false
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if viewsLaidOut == false {
            setupViews()
            viewsLaidOut = true
        }
    }
    
    //MARK: Actions
    @IBAction func roundUpButtonTapped(_ sender: Any) {
        roundDownButtonLabel.isHidden = true
        roundUpButtonLabel.isHidden = true
        roundUp()
    }
    @IBAction func roundDownButtonTapped(_ sender: Any) {
        roundUpButtonLabel.isHidden = true
        roundDownButtonLabel.isHidden = true
        roundDown()
    }
    @IBAction func tenPercentButtonTapped(_ sender: Any) {
        tipPercent = 10
        percentTipChosen()
    }
    @IBAction func fifteenPercentButtonTapped(_ sender: Any) {
        tipPercent = 15
        percentTipChosen()
    }
    @IBAction func eighteenPercentButtonTapped(_ sender: Any) {
        tipPercent = 18
        percentTipChosen()
    }
    @IBAction func twentyPercentButtonTapped(_ sender: Any) {
        tipPercent = 20
        percentTipChosen()
    }
    @IBAction func calculateButtonTapped(_ sender: Any) {
        guard let billTotalAmount = billTotalTextField.text, !billTotalAmount.isEmpty else {return}
        
        self.tipAmountLabel.isHidden = false
        self.tipLabel.isHidden = false
        self.totalAmountLabel.isHidden = false
        self.totalLabel.isHidden = false
        self.roundUpButtonLabel.isHidden = false
        self.roundDownButtonLabel.isHidden = false
        
        calculateTip()
    }
    
    //MARK: - Methods
    func setupViews() {
        self.view.backgroundColor = .beigeBg
        self.tipAmountLabel.isHidden = true
        self.tipLabel.isHidden = true
        self.totalAmountLabel.isHidden = true
        self.totalLabel.isHidden = true
        self.roundUpButtonLabel.isHidden = true
        self.roundDownButtonLabel.isHidden = true
    }
    
    func calculateTip() {
        guard let billTotalAmount = billTotalTextField.text, !billTotalAmount.isEmpty else {return}
        let billDouble = Double(billTotalAmount)
        let billAmount = billDouble ?? 0.00
        
        if customTipTextField.text != nil && customTipTextField.text != "" {
            guard let customTip = customTipTextField.text else {return}
            tipPercent = Int(customTip) ?? 0
            percentTipChosen()
        }
        
        let doubleTip = Double(tipPercent)/100
        let tip = billAmount * doubleTip
        let total = billAmount + tip
        
        tipAmountLabel.text = "$" + String(format: "%.2f", tip)
        totalAmountLabel.text = "$" + String(format: "%.2f", total)
        
        finalTip = tip
        finalTotal = total
    }
    
    func percentTipChosen() {
        switch tipPercent {
        case 10:
            tenPercentLabel.backgroundColor = .brickAccent
            fifteenPercentLabel.backgroundColor = .redAccent
            eighteenPercentLabel.backgroundColor = .redAccent
            twentyPercentLabel.backgroundColor = .redAccent
            customTipTextField.text = ""
            
        case 15:
            tenPercentLabel.backgroundColor = .redAccent
            fifteenPercentLabel.backgroundColor = .brickAccent
            eighteenPercentLabel.backgroundColor = .redAccent
            twentyPercentLabel.backgroundColor = .redAccent
            customTipTextField.text = ""
            
        case 18:
            tenPercentLabel.backgroundColor = .redAccent
            fifteenPercentLabel.backgroundColor = .redAccent
            eighteenPercentLabel.backgroundColor = .brickAccent
            twentyPercentLabel.backgroundColor = .redAccent
            customTipTextField.text = ""
            
        case 20:
            tenPercentLabel.backgroundColor = .redAccent
            fifteenPercentLabel.backgroundColor = .redAccent
            eighteenPercentLabel.backgroundColor = .redAccent
            twentyPercentLabel.backgroundColor = .brickAccent
            customTipTextField.text = ""
            
        default:
            tenPercentLabel.backgroundColor = .redAccent
            fifteenPercentLabel.backgroundColor = .redAccent
            eighteenPercentLabel.backgroundColor = .redAccent
            twentyPercentLabel.backgroundColor = .redAccent
        }
    }
    
    func roundUp() {
        let currentTotal = finalTotal.rounded(.up)
        let difference = currentTotal - finalTotal
        let currentTip = finalTip + difference
        
        tipAmountLabel.text = "$" + String(format: "%.2f", currentTip)
        totalAmountLabel.text = "$" + String(format: "%.2f", currentTotal)
    }
     
    func roundDown() {
        let currentTotal = finalTotal.rounded(.down)
        let difference = finalTotal - currentTotal
        let currentTip = finalTip - difference
        
        tipAmountLabel.text = "$" + String(format: "%.2f", currentTip)
        totalAmountLabel.text = "$" + String(format: "%.2f", currentTotal)
    }
}
