//
//  DetailsViewController.swift
//  ChallengeKobe
//
//  Created by Bruno Dorneles on 28/10/18.
//  Copyright © 2018 Bruno. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var overviewTextView: UITextView!
    var movie : Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = movie.getPosterURL() {
            posterImage.af_setImage(withURL: url, placeholderImage: StaticImages.placeHolderImage)
        }
        self.title = movie.original_title
        overviewTextView.text = movie.overview
        
        var detailString = "Genre: \(movie.genres) \nRelease date: \(DateFormatter.formatToShow(date: movie.release_date))"
        detailsTextView.text = detailString
        self.navigationItem.largeTitleDisplayMode = .never
      
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
