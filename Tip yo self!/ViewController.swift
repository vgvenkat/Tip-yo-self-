//
//  ViewController.swift
//  Tip yo self!
//
//  Created by Venkataraman Valady Ganesan on 9/21/16.
//  Copyright © 2016 Venkataraman Valady Ganesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipValue: UILabel!
    @IBOutlet weak var tipStepper: UIStepper!
    
    @IBOutlet weak var CurrencyValue: UILabel!
   
    @IBOutlet weak var peopleValue: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var eachLabel: UILabel!
    
    @IBOutlet weak var tipProgress: UIProgressView!
    @IBOutlet weak var peopleProgress: UIProgressView!
    
    var currencyFormatter = NumberFormatter()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.clearsOnBeginEditing = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = NSLocale.current
        
        let billString = billField.text!
        CurrencyValue.text = NSLocale.current.currencySymbol

        
       
       
        
        
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
  //      let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
   //     let total = bill + tip
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        print(formatter.numberStyle)
      //  formatter.locale = .locale
        
     //   billField.text = "\(formatter.number(from: "\(bill)"))" ?? ""
        
   //     tipLabel.text = String.init(format: "$%.2f", tip)
   //     totalLabel.text = String.init(format: "$%.2f", total)
       
       
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let defaultSetTip = defaults.integer(forKey: "defaultTipKey")
        print(defaultSetTip)
     //   tipControl.selectedSegmentIndex = defaultSetTip
    //    self.calculateTip(tipControl)
    }

    @IBAction func tipChanged(_ sender: UIStepper) {
        recalculateValues()
    }
    
    @IBAction func billChange(_ sender: UITextField) {
               recalculateValues()
        
    }
    
    @IBAction func peopleChanged(_ sender: UIStepper) {
        recalculateValues()
    }
    func recalculateValues() {
        let tipRange = ["15","18","21","24"]
        let peopleRange = ["1","2","3","4","5"]
        
        let bill = Double(billField.text!) ?? 0
        let tips = tipStepper.value
        let peoples = peopleStepper.value
        
        let tipCalc = bill * (tips/100)
        tipValue.text = String(Int(tips))+"%"
        tipLabel.text = String.init(format: "%.2f", tipCalc)
        tipProgress.progress = Float(tipRange.index(of: String(Int(tipStepper.value)))!+1)/4.0
        
        
        let totals = bill+tipCalc
        totalLabel.text = String.init(format: "%.2f", totals)
        peopleValue.text = String(Int(peoples))
        let eachPerson = totals/peoples
        
        eachLabel.text = String.init(format:"%.2f", eachPerson)
        peopleProgress.progress = Float(peopleRange.index(of: String(Int(peopleStepper.value)))!+1)/5.0
    }
}

