//
//  Trip.swift
//  Tour
//
//  Created by Hoanglong on 6/17/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import Foundation
import Firebase

class Trip {
    var labelTrip: String
    var imageTrip: String?
    var endDate: String?
    var startDate: String?
    
    //MARK: Initialization
    
    init?(labelTrip: String, imageTrip: String?, endDate: String?, startDate: String?) {
        
        // The name must not be empty
        guard !labelTrip.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.labelTrip = labelTrip
        self.imageTrip = imageTrip
        self.endDate = endDate
        self.startDate = startDate
        
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let nameTrip = dict["name_trip"] as? String,
            let imageTrip = dict["image_trip"] as? String,
            let endDate = dict["end_date"] as? String,
            let startDate = dict["start_date"] as? String
            else { return nil }
            
        self.labelTrip = nameTrip
        self.imageTrip = imageTrip
        self.startDate = startDate
        self.endDate = endDate
    }
    
    static func posts(completion: @escaping ([Trip]) -> Void) {
        let ref = Database.database().reference().child("Tours")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            let posts = snapshot.reversed().compactMap(Trip.init)
            completion(posts)
        })
    }
}
