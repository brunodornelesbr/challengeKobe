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
    // 1
    guard !isFetchInProgress else {
        return
    }
    
    // 2
    isFetchInProgress = true
    
        let url = String(format:API.upcomingMovies_url, page)
        
        Alamofire.request(url,method: .get, parameters : nil, headers : nil).responseObject(completionHandler: {(response:DataResponse<UpcomingMoviesRequestObject>) in
            isFetchInProgress = false
            completion(response.result.value)

        })
        
    }
}
