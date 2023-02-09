//
//  NowPlayingMovieData.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 09.02.2023.
//

import Foundation

struct NowPlayingMovieData: Decodable {
    let results: [NowPlayingMovieResults]
    
    struct NowPlayingMovieResults: Decodable {
        let backdrop_path: String
        let id: Int
        let genre_ids: [Int]
        let overview: String
        let poster_path: String
        let title: String
        let release_date: String
    }
}
