//
//  MovieHome.swift
//  CurveMovies
//
//  Created by John Cranstone on 25/04/2019.
//  Copyright © 2019 John Cranstone. All rights reserved.
//

import UIKit

    var movieName = [String]()
    var movieRelease = [String]()
    var movieDesc = [String]()
    var movieRating = [Double]()
    var moviePath = [String]()
    var pageNum = 1


class MovieListController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()

    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        return movieName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let count = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCellView
     
        cell.setCell(count:count)
        
        return cell
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let bottom = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        //  if user reaches the bottom of the list
        if(bottom > contentHeight - scrollView.frame.height){
            // add 1 to page number in Movies.swift query URL
            pageNum = pageNum + 1
            pullMovies(page: +pageNum)
            self.tableView.reloadData() 
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
    }


}

