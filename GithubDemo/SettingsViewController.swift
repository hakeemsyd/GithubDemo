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
    var langs: [String: Bool] = ["Filter by language?": false, "Java" : false, "Objective-C":false, "Javascript":false, "Python":false, "Ruby":false, "Swift":false]

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

    /*func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }*/
    
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
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Languages"
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "lang", for: indexPath)
            as? SettingCell else {
            return UITableViewCell()
        }
        
        cell.langLabelView.text = Utility.keys[indexPath.row]
        cell.langToggleView.isOn = langs[Utility.keys[indexPath.row]]!
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
        //return section == 0 ? 1 : langs.count
        if(langs[Utility.keys[0]] == false){
            return 1
        }
        
        return langs.count
    }
    
    func settingSwitchChanged(settingCell: SettingCell, switchIsOn: Bool) {
        print( "\(settingCell.langLabelView.text ??  "Unknown"):\(switchIsOn)")
        let k = Utility.keys[settingCell.cellIdx]
        langs[k] = switchIsOn
        
        var rows = [IndexPath]()
        for index in 1...langs.count - 2 {
            rows.append(IndexPath(row: index, section: 0))
        }
        if(settingCell.cellIdx == 0){
            if(switchIsOn){
                tableView.reloadData()
            } else {
                tableView.reloadData()
                //tableView.reloadRows(at: rows, with: UITableViewRowAnimation.top)
            }
            
        }
    }
}
