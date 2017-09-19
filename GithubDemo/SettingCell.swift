//
//  SettingCell.swift
//  GithubDemo
//
//  Created by Syed Hakeem Abbas on 9/19/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet weak var langToggleView: UISwitch!
    @IBOutlet weak var langLabelView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
