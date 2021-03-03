//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var numPartySplit: Float = 2.0;
    var tipAsFloatTo1DecimalPlace: Float = 0.1
    var billAmount: Float = 0.0
    var perPersonTotal: Float = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle == "0%"
        {
            tipAsFloatTo1DecimalPlace = 0.0
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
        else if sender.currentTitle == "10%"
        {
            tipAsFloatTo1DecimalPlace = 0.1
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        }
        else
        {
            tipAsFloatTo1DecimalPlace = 0.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numPartySplit = Float(sender.value)
        splitNumberLabel.text = String(format: "%.0f", numPartySplit)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billAsFloat = Float(billTextField.text ?? "0.0")
        print("billAsFloat: \(billAsFloat!)")
        print("tipAsFloat: \(tipAsFloatTo1DecimalPlace)")
        let tipAmount = billAsFloat! * tipAsFloatTo1DecimalPlace
        print("tipAmount: \(tipAmount)")
        let billPlusTip = billAsFloat! + tipAmount
        perPersonTotal = billPlusTip / numPartySplit
        print("Per person total: \(perPersonTotal)")
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get the new view controller using segue.destination.
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.perPersonTotal = String(format: "%.2f", perPersonTotal)
            destinationVC.numberOfPeople = String(format: "%.0f", numPartySplit)
            destinationVC.tipPercentage = String(format: "%.0f", tipAsFloatTo1DecimalPlace * 100) + "%"
        }
        //Pass the selected object to the new view controller.
    }
}
