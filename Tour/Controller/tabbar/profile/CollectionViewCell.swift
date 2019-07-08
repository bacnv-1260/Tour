//
//  CollectionViewCell.swift
//  Tour
//
//  Created by Hoanglong on 7/7/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTrip: UILabel!
    @IBOutlet weak var dateTrip: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
