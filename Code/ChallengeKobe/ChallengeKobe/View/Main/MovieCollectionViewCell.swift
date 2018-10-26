//
//  MovieCollectionViewCell.swift
//  ChallengeKobe
//
//  Created by Bruno Dorneles on 26/10/18.
//  Copyright © 2018 Bruno. All rights reserved.
//

import UIKit
import  AlamofireImage
class MovieCollectionViewCell: UICollectionViewCell {
    static let xibName = "MovieCollectionViewCell"
    static let reuseIdentifier = "MovieCollectionViewCell"
     let placeHolderImage = UIImage(imageLiteralResourceName: "placeHolder")
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var labelImage: UILabel!
    
    
    var movie : Movie!{didSet{configureCell()}}
    
    
    override func prepareForReuse() {
        posterImage.image = placeHolderImage
        labelImage.text = ""
    }
    func configureCell(){
        if let url = movie.getPosterURL() {
        posterImage.af_setImage(withURL: url, placeholderImage: placeHolderImage)
        }
        
        labelImage.text = movie.original_title
    }
}
