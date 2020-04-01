//
//  FormTableViewCell.swift
//  project Food Passion
//
//  Created by Evelyn on 04/05/19.
//  Copyright © 2019 Evelyn. All rights reserved.
//

import UIKit

class FormTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

     @IBOutlet weak var userDataLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
