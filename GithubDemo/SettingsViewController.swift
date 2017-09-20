//
//  SettingsViewController.swift
//  GithubDemo
//
//  Created by Syed Hakeem Abbas on 9/17/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingCellDelegate{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentValueView: UILabel!
    @IBOutlet weak var starsSlider: UISlider!
    var keys: [String] = ["Java", "Objective-C", "Javascript", "Python", "Ruby", "Swift"]
    var langs: [String: Bool] = ["Java" : false, "Objective-C":false, "Javascript":false, "Python":false, "Ruby":false, "Swift":false]

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let prevValue = defaults.float(forKey: Utility.KEY_STARS_SETTING)
        if let prevDict = defaults.dictionary(forKey: Utility.KEY_LANG_PREF) as! [String:Bool]?{
            langs = prevDict
        }
        //keys = langs.allKeys as! [String]
        starsSlider.setValue(prevValue, animated: true)
        currentValueView.text = "\(Int(prevValue))"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onClose(_ sender: Any, forEvent event: UIEvent) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onSilderChanged(_ sender: UISlider, forEvent event: UIEvent) {
        currentValueView.text = "\(Int(sender.value))"
    }
    
    @IBAction func onSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(starsSlider.value, forKey: Utility.KEY_STARS_SETTING)
        defaults.setValue(langs, forKey: Utility.KEY_LANG_PREF)
        defaults.synchronize()
        dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Languages"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "lang", for: indexPath)
            as? SettingCell else {
            return UITableViewCell()
        }
        
        cell.langLabelView.text = keys[indexPath.row]
        cell.langToggleView.isOn = langs[keys[indexPath.row]]!
        cell.delegate = self
        cell.cellIdx = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(langs.count <= 0){
            tableView.isHidden = true
        } else {
            tableView.isHidden = false
        }
        return langs.count
    }
    
    func settingSwitchChanged(settingCell: SettingCell, switchIsOn: Bool) {
        print( "\(settingCell.langLabelView.text ??  "Unknown"):\(switchIsOn)")
        let k = keys[settingCell.cellIdx]
        langs[k] = switchIsOn
    }
}
