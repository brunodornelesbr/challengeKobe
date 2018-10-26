//
//  Movie.swift
//  ChallengeKobe
//
//  Created by Bruno Dorneles on 26/10/18.
//  Copyright © 2018 Bruno. All rights reserved.
//

import UIKit
import ObjectMapper

class Movie: Mappable {
    
    var id  = -1
    var original_title = ""
    var poster_path : String?
    var backdrop_path : String?
    var genres = [String]()
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        original_title <- map["original_title"]
        poster_path <- map["poster_path"]
        backdrop_path <- map["backdrop_path"]
        var genre_ids = [Int]()
        genre_ids <- map["genre_ids"]
    }
}
