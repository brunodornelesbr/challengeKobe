//
//  DateFormatter+Extension.swift
//  ChallengeKobe
//
//  Created by Bruno Dorneles on 28/10/18.
//  Copyright © 2018 Bruno. All rights reserved.
//

import UIKit

extension DateFormatter {
    static func formatFromAPI(string: String)->Date?{
         var dateFormatter = DateFormatter(withFormat: "yyyy-mm-dd", locale: "en-US")
       return dateFormatter.date(from: string)
    }
    static func formatToShow(date : Date?)->String{
        guard date != nil else {return "N/D"}
        
         var dateFormatter = DateFormatter(withFormat: "mm/dd/yy", locale: "en-US")
      return  dateFormatter.string(from: date!)
    }
}
