//
//  ApiService.swift
//  Alamofire_Practice_movieData
//
//  Created by uiskim on 2023/05/11.
//

import UIKit

import Alamofire

class ApiService {
    static let shared = ApiService()
    
    let url = "https://api.themoviedb.org/3/movie/popular?api_key=1862a0edf74034806700802061bd0ce4&language=ko-KR"
    
    func fetchMovie(completion: @escaping([MovieDTO])->Void) {
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .responseData { datas in
                guard let value = datas.value else {fatalError()}
                let data = try! JSONDecoder().decode(Movies.self, from: value)
                let myMovieList = data.results.map { movieData in
                    MovieDTO(title: movieData.title, releaseDate: movieData.releaseDate, imagePath: movieData.posterPath)
                }
                completion(myMovieList)
            }
    }
}


