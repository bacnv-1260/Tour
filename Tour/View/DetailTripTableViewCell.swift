//
//  DetailTripTableViewCell.swift
//  Tour
//
//  Created by nguyen.thi.huec on 6/21/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import UIKit

class DetailTripTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
