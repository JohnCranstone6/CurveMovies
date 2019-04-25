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
    
    let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=9b35991200df7847ea388645c6a30663&page="+String(page))! //Variable needed in Page for continuous scroll
    
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }
        //print(String(data: data, encoding: .utf8)!)
        do{
            let descr = try JSONDecoder().decode(description.self, from: data)
            /*print(descr.page)
            print(descr.total_pages)
            print(descr.total_results)
            */
            for i in (0..<descr.results.count){
                
             /*   print(descr.results[i].title)
                print(descr.results[i].overview)
                print(descr.results[i].vote_average)
                print(descr.results[i].poster_path)
                print(descr.results[i].release_date)
             */
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
