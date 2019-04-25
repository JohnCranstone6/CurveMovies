//
//  Movies.swift
//  CurveMovies
//
//  Created by John Cranstone on 25/04/2019.
//  Copyright © 2019 John Cranstone. All rights reserved.
//

import Foundation

struct description: Decodable{
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]
}

struct Movie: Decodable {
    let title: String
    let release_date: String
    let overview: String
    let vote_average: Double
    let poster_path: String
}

//API Call
//https://api.themoviedb.org/3/movie/popular?api_key=9b35991200df7847ea388645c6a30663&page=1

func pullMovies(page:Int){
    
    let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=9b35991200df7847ea388645c6a30663&page="+String(page))!
    
    
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }

        do{ //JSON decode parses through URL return date
            let descr = try JSONDecoder().decode(description.self, from: data)
          
      
            for i in (0..<descr.results.count){
                
                //append string arrays with parsed data.
                
                movieName.append(descr.results[i].title)
                movieDesc.append(descr.results[i].overview)
                movieRating.append(descr.results[i].vote_average)
                moviePath.append(descr.results[i].poster_path)
                movieRelease.append(descr.results[i].release_date)

            }
            
        }catch let error{
            print("Error: ",error)
        }
    }
    task.resume()
    
}
