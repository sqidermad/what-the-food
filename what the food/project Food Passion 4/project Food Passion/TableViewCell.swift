//
//  TableViewCell.swift
//  Search
//
//  Created by Sherly Natalia on 08/05/19.
//  Copyright © 2019 Sherly Natalia. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var textCalorie: UILabel!
    @IBOutlet weak var imagesView: UIImageView!
    @IBOutlet weak var moreImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
