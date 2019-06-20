//
//  TripDetail.swift
//  Tour
//
//  Created by nguyen.thi.huec on 6/21/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import UIKit

class TripDetail {
    
    var labelTitle:String
    var labelInfo: String
    
    //MARK: Initialization
    
    init?(labelTitle: String, labelInfo: String) {
        // The name must not be empty
        guard !labelInfo.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.labelInfo = labelInfo
        self.labelTitle = labelTitle
    }
    
}
