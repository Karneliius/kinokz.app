//
//  GenreData.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 07.02.2023.
//

import Foundation

struct GenreData: Decodable {
    let genres: [Genre]
    
    struct Genre: Decodable {
        let id: Int
        let name: String
    }
}
