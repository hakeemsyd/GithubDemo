//
//  SettingsViewController.swift
//  GithubDemo
//
//  Created by Syed Hakeem Abbas on 9/17/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var currentValueView: UILabel!
    @IBOutlet weak var starsSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let prevValue = defaults.float(forKey: Utility.KEY_STARS_SETTING)
        starsSlider.setValue(prevValue, animated: true)
        currentValueView.text = "\(prevValue)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onClose(_ sender: Any, forEvent event: UIEvent) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onSilderChanged(_ sender: UISlider, forEvent event: UIEvent) {
        currentValueView.text = "\(sender.value)"
    }
    
    @IBAction func onSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(starsSlider.value, forKey: Utility.KEY_STARS_SETTING)
        defaults.synchronize()
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
