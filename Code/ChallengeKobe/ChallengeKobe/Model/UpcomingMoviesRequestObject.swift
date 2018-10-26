//
//  UpcomingMoviesRequestObject.swift
//  ChallengeKobe
//
//  Created by Bruno Dorneles on 26/10/18.
//  Copyright © 2018 Bruno. All rights reserved.
//

import UIKit
import ObjectMapper

class UpcomingMoviesRequestObject: Mappable {
  var success = true
  var movieList = [Movie]()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        movieList <- map["results"]
        success <- map["success"]
    }
}
