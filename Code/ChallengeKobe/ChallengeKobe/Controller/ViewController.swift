//
//  ViewController.swift
//  ChallengeKobe
//
//  Created by Bruno Dorneles on 26/10/18.
//  Copyright © 2018 Bruno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Request.requestUpcomingMoviesList(completion: {result in
            print(result)
        })
        // Do any additional setup after loading the view, typically from a nib.
    }


}

