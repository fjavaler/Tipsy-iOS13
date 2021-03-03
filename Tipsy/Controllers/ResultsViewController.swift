//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by GPS Dev on 3/2/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var perPersonTotal: String?
    var numberOfPeople: String?
    var tipPercentage: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        totalLabel.text = perPersonTotal ?? "0.00"
        settingsLabel.text = "Split between \(numberOfPeople ?? "0") people, with \(tipPercentage ?? "0") tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
