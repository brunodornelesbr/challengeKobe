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
    var lastRequest : UpcomingMoviesRequestObject?
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        searchBarSetup()
        Request.updateGenres {
            self.requestUpcomingMovies(page: 1)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
      

    }
    
    func requestUpcomingMovies(page : Int){
        guard page <= lastRequest?.total_pages ?? Int(FP_INFINITE) else {return}
        Request.requestUpcomingMoviesList(page:page,completion: {movies in
            if movies?.success ?? false{
                DispatchQueue.main.async {
                    self.showingMovies.append(contentsOf: movies!.movieList)
                    self.collectionView.reloadSections([0])
                    self.lastRequest = movies
                    self.refreshControl.endRefreshing()
                }
               
            }
        })
    }

    @objc func refreshMovies(){
        showingMovies = []
        lastRequest = nil
        requestUpcomingMovies(page: 1)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showDetail":
            if let destination = segue.destination as? DetailsViewController {
                let movie = sender as! Movie
                destination.movie = movie
            }
        default:
            break
        }
    }
 

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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if indexPath.row >= showingMovies.count-5
        {
            requestUpcomingMovies(page: (lastRequest?.page ?? 0) + 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: showingMovies[indexPath.row])
    }
    
    func collectionViewSetup(){
        collectionView.register(UINib(nibName: MovieCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.refreshControl = refreshControl
        
        self.extendedLayoutIncludesOpaqueBars = true
        refreshControl.addTarget(self, action: #selector(refreshMovies), for: .valueChanged)

        refreshControl.tintColor = .white
        let attributedStringColor = [NSAttributedString.Key.foregroundColor : UIColor.white]
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to update movies!", attributes: attributedStringColor)
     }
    
    
    
    
}


extension MainViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        return
    }
    
    
    func searchBarSetup(){
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.barStyle = .black
        search.searchBar.placeholder = "Search upcoming movies"
        definesPresentationContext = true
        self.navigationItem.searchController = search
    }
}
