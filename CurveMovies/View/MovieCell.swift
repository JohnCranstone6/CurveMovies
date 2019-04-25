//
//  Cell.swift
//  CurveMovies
//
//  Created by John Cranstone on 25/04/2019.
//  Copyright © 2019 John Cranstone. All rights reserved.
//
import Foundation
import UIKit

class MovieCell: UITableViewCell {
 
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieRatingLbl: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    
    func setCell(count:Int){

        let url = URL(string: "http://image.tmdb.org/t/p/w500/"+moviePath[count])
        
        DispatchQueue.global().async {

        let data = try? Data(contentsOf: url!)
            if let imageData = data {
                let poster = UIImage(data: imageData)
                    DispatchQueue.main.async {
                    self.moviePoster.image = poster
                    }
            }
        }
            movieTitle.text = movieName[count]
            movieDescription.text = movieDesc[count]
            releaseDate.text = movieRelease[count]
            
        let formatReady = movieRating[count] * 10
        if(formatReady < 40){
            movieRatingLbl.textColor = UIColor.red
        }else if(formatReady < 70 && formatReady >= 40 ){
            movieRatingLbl.textColor = UIColor.orange
        }else{
            movieRatingLbl.textColor = UIColor.green
        }
        let ratingFormatted = String(format:"%.0f%%",formatReady)
            movieRatingLbl.text = ratingFormatted
    }
}
