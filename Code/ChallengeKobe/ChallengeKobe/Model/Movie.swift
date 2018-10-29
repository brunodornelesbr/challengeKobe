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
    var genres = ["testGenre1" ,"TestGenre2"]
    var release_date : Date?
    var overview = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        original_title <- map["original_title"]
        poster_path <- map["poster_path"]
        backdrop_path <- map["backdrop_path"]
        overview <- map["overview"]

        var genre_ids = [Int]()
        genre_ids <- map["genre_ids"]
        
        var release = ""
        release<-map["release_date"]
        release_date = DateFormatter.formatFromAPI(string: release)
    }
    
    func getPosterURL()->URL?{
        guard poster_path != nil else {return nil}
        let urlString = String(format:API.image_url,poster_path!)
        
        return URL(string: urlString)
    }
    
    func setDate(string : String){
       
        
    }
}
