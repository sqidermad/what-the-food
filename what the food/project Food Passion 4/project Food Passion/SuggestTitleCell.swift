//
//  SuggestTitleCell.swift
//  Suggestion
//
//  Created by Sherly Natalia on 07/05/19.
//  Copyright © 2019 Sherly Natalia. All rights reserved.
//

import UIKit

class SuggestTitleCell: UITableViewCell {
    @IBOutlet weak var addFoodButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.applyRoundCorner(addFoodButton)
    }
    
    func applyRoundCorner(_ object:AnyObject) {
        object.layer.cornerRadius = object.frame.size.width / 5
        object.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
