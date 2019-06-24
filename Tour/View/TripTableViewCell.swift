//
//  TripTableViewCell.swift
//  Tour
//
//  Created by Hoanglong on 6/17/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageTrip: UIImageView!
    @IBOutlet weak var labelTrip: UILabel!
    @IBOutlet weak var dateTrip: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
