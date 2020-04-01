//
//  addFoodTableViewCell.swift
//  project Food Passion
//
//  Created by Evelyn on 07/05/19.
//  Copyright © 2019 Evelyn. All rights reserved.
//

import UIKit

class addFoodTableViewCell: UITableViewCell {

    @IBOutlet weak var addFoodBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.applyRoundCorner(addFoodBtn)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func applyRoundCorner(_ object:AnyObject) {
        object.layer.cornerRadius = object.frame.size.width / 7
        object.layer.masksToBounds = true
    }
}
