//
//  MainViewController.swift
//  ChallengeKobe
//
//  Created by Bruno Dorneles on 26/10/18.
//  Copyright © 2018 Bruno. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var showingMovies = [Movie]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        requestUpcomingMovies()
    }
    
    func requestUpcomingMovies(){
        Request.requestUpcomingMoviesList(completion: {movies in
            if movies?.success ?? false{
                self.showingMovies = (movies?.movieList)!
                self.collectionView.reloadSections([0])
            }
        })
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


extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return showingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cel = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        let movie = showingMovies[indexPath.row]
        cel.movie = movie
        return cel
    }
    
    func collectionViewSetup(){
        collectionView.register(UINib(nibName: MovieCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let search = UISearchController(searchResultsController: nil)
       // search.searchResultsUpdater = self
        search.searchBar.barStyle = .black
        self.navigationItem.searchController = search

    }
    
    
    
}
