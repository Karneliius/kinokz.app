//
//  MovieData.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 01.02.2023.
//


import Foundation

struct MovieData: Decodable {
    let results: [Results]
    
    struct Results: Decodable {
        let backdrop_path: String?
        let id: Int
        let title: String
        let poster_path: String
        let genre_ids: [Int]
    }
}
