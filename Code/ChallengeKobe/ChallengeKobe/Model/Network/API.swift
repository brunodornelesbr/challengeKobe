//
//  API.swift
//  ChallengeKobe
//
//  Created by Bruno Dorneles on 26/10/18.
//  Copyright © 2018 Bruno. All rights reserved.
//

import UIKit

struct API {
 static let api_key = "c5850ed73901b8d268d0898a8a9d8bff"
 static let base_url = "https://api.themoviedb.org/3"
 static let upcomingMovies_url = "\(base_url)/movie/upcoming?api_key=\(api_key)&page=%d"
static let image_url = "https://image.tmdb.org/t/p/w500/%@"
}
