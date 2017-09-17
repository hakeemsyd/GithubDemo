//
//  GithubCell.swift
//  GithubDemo
//
//  Created by Syed Hakeem Abbas on 9/16/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class GithubCell: UITableViewCell {

    @IBOutlet weak var authorLabelView: UILabel!
    @IBOutlet weak var forksLabelView: UILabel!
    @IBOutlet weak var starsLabelView: UILabel!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var descriptionView: UILabel!
    @IBOutlet weak var displayImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
