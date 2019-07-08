//
//  HeaderViewCell.swift
//  Tour
//
//  Created by Hoanglong on 7/8/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import UIKit

class HeaderViewCell: UITableViewCell {

    @IBOutlet weak var titleHeader: UILabel!
    var title = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
