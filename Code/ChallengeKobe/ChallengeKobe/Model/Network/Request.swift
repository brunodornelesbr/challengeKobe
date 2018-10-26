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
    
   static func requestUpcomingMoviesList(page : Int = 1,completion:@escaping(UpcomingMoviesRequestObject?)->()){
        let url = String(format:API.upcomingMovies_url, page)
        
        Alamofire.request(url,method: .get, parameters : nil, headers : nil).responseObject(completionHandler: {(response:DataResponse<UpcomingMoviesRequestObject>) in
            
            completion(response.result.value)
        })
        
    }
//    func trainingActivities(token : String, moduleId : Int, completion:@escaping (ActivityList?)->()){
//        let url = String(format: Api.url_activity, moduleId)
//        
//        self.headers = [
//            "Authorization": "Bearer " + token
//        ]
//        
//        Alamofire.request(url, method: .get, parameters: nil, headers: headers)
//            .responseObject { (response: DataResponse<ActivityList>) in
//                if response.result.isSuccess {
//                    completion(response.result.value)
//                    
//                } else {
//                    completion(nil)
//                }
//        }
//        
//        
//    }
}
