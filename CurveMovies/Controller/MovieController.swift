//
//  SpecificMovie.swift
//  CurveMovies
//
//  Created by John Cranstone on 25/04/2019.
//  Copyright © 2019 John Cranstone. All rights reserved.
//

import Foundation
import UIKit
var row = Int()
class MovieController: UIViewController{
    @IBOutlet weak var lblTest: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://image.tmdb.org/t/p/w500/"+moviePath[row])
        
        DispatchQueue.global().async {

            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {

                self.posterView.image = UIImage(data: data!)
                
            }
        }
    }
    
    
    
    
    
    
}
