//
//  ViewController.swift
//  Tip yo self!
//
//  Created by Venkataraman Valady Ganesan on 9/21/16.
//  Copyright © 2016 Venkataraman Valady Ganesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view did appear")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.20, 0.25]
        print("calculate bill")
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let defaultSetTip = defaults.integer(forKey: "defaultTipKey")
        print(defaultSetTip)
        tipControl.selectedSegmentIndex = defaultSetTip
        self.calculateTip(tipControl)
    }

}

