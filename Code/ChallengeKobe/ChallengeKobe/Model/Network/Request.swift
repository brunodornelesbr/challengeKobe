//
//  Request.swift
//  ChallengeKobe
//
//  Created by Bruno Dorneles on 26/10/18.
//  Copyright © 2018 Bruno. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper
import UIKit

class Request: NSObject {
   static var isFetchInProgress = false
   static func requestUpcomingMoviesList(page : Int = 1,completion:@escaping(UpcomingMoviesRequestObject?)->()){
    guard !isFetchInProgress else {
        return
    }
    isFetchInProgress = true
        let url = String(format:API.upcomingMovies_url, page)
        Alamofire.request(url,method: .get, parameters : nil, headers : nil).responseObject(completionHandler: {(response:DataResponse<UpcomingMoviesRequestObject>) in
            isFetchInProgress = false
            completion(response.result.value)
        })
    }
    
    static func searchMovie(query : String,page : Int = 1,completion:@escaping(UpcomingMoviesRequestObject?)->()){
        guard !isFetchInProgress else {
            return
        }
        isFetchInProgress = true
        let url = String(format:API.search_movie,query,page)
        Alamofire.request(url,method: .get, parameters : nil, headers : nil).responseObject(completionHandler: {(response:DataResponse<UpcomingMoviesRequestObject>) in
            isFetchInProgress = false
            completion(response.result.value)
        })
    }
    
    
    
    static func updateGenres(completion:@escaping()->()){
        let url = API.genre_list
        Alamofire.request(url,method: .get, parameters : nil, headers : nil).responseObject(completionHandler: {(response:DataResponse<Genres>) in
            completion()
            
        })
    }
    
    
}
