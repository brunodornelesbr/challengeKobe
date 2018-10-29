//
//  Genres.swift
//  ChallengeKobe
//
//  Created by Bruno Dorneles on 29/10/18.
//  Copyright © 2018 Bruno. All rights reserved.
//

import UIKit
import ObjectMapper

class Genres: Mappable {
    static var genre = [Genre]()
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map){
        Genres.genre <- map["genres"]
    }
    
   static func getGenre(id: Int)->String{
        for nGenre in Genres.genre {
            if nGenre.id == id {return nGenre.name}
        }
        return "n/d"
    }
}

class Genre : Mappable {
    var id = 0
    var name = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map){
        id <- map["id"]
        name <- map["name"]
    }
}
