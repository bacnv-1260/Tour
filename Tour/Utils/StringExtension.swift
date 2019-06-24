//
//  StringExtension.swift
//  Tour
//
//  Created by Hoanglong on 6/17/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import Foundation

extension String {
    static func compareWithTheUpcommingDay(startString: String) -> Bool {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let currentString = formatter.string(from: currentDate)
        
        if startString > currentString {
            return true
        }
        return false
    }
    
    static func compareWithTookPlaceDay(startString: String, endString: String) -> Bool {
        let currentDate = Date().timeIntervalSince1970
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let startDate = formatter.date(from: startString)?.timeIntervalSince1970 ?? 0
        let endDate = formatter.date(from: endString)?.timeIntervalSince1970 ?? 0
        
        if startDate < currentDate && endDate < currentDate {
            return true
        }
        return false
    }
    
    static func convertDate(dateString: String?) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd/MM/yyyy"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM"
        
        guard  let dateString = dateString, let date = dateFormatterGet.date(from: dateString) else {
            return ""
        }
        return dateFormatterPrint.string(from: date)
    }
}
