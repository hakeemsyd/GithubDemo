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
    var langs: [(name: String, val: Bool)] = [(name: String, val: Bool)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let prevValue = defaults.float(forKey: Utility.KEY_STARS_SETTING)
        starsSlider.setValue(prevValue, animated: true)
        currentValueView.text = "\(Int(prevValue))"
        langs.append((name: "C++", val: true))
        langs.append((name: "Swift", val: false))
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
        
        let item = langs[indexPath.row]
        cell.langLabelView.text = item.name
        cell.langToggleView.isOn = item.val
        cell.delegate = self
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
        
        print( "\(switchIsOn)")
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
