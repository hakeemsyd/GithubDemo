//
//  SettingCell.swift
//  GithubDemo
//
//  Created by Syed Hakeem Abbas on 9/19/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

// #1: Declare the delegate protocol
//the @objc is needed here for the protocol to work
@objc protocol SettingCellDelegate {
    //defining delegate functions
    func settingSwitchChanged(settingCell: SettingCell, switchIsOn: Bool)
}

class SettingCell: UITableViewCell {

    @IBOutlet weak var langToggleView: UISwitch!
    @IBOutlet weak var langLabelView: UILabel!
    weak var delegate: SettingCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        langToggleView.addTarget(self, action: #selector(switchValueChanged(filterSwitch:)), for: .valueChanged)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func switchValueChanged(filterSwitch: UISwitch) {
        // #3: Call the delegate function
        delegate?.settingSwitchChanged(settingCell: self, switchIsOn: filterSwitch.isOn)
    }
}
