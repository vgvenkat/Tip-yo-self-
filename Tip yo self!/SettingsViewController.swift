//
//  SettingsViewController.swift
//  Tip yo self!
//
//  Created by Venkataraman Valady Ganesan on 9/21/16.
//  Copyright © 2016 Venkataraman Valady Ganesan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let defaultSetTip = defaults.integer(forKey: "defaultTipKey")
        print("Default view did tip", defaultSetTip)

        defaultTipSegment.selectedSegmentIndex =  defaultSetTip
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func setDefaultTip(_ sender: AnyObject) {
        
        
        let currentTipSelection = defaultTipSegment.selectedSegmentIndex
        print("Current selection in settings", currentTipSelection)
        
        let defaults = UserDefaults.standard
        defaults.set(currentTipSelection, forKey: "defaultTipKey")
        
        defaults.synchronize()
        
    }
}
