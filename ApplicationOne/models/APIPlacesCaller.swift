//
//  APIPLacesCaller.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 09.02.2023.
//

import Foundation

protocol APIPlaceCallerDelegate {
    
    func didUpdateMovieList(with nowPlayingMovieList: [NowPlayingMovieModel])
    func didFailWithError(_ error: Error)
    
}

struct APIPlaceCaller {
    
    var delegate: APIPlaceCallerDelegate?
    
    func fetchRequest() {
            let urlString = Constants.URLs.nowPlaying
            guard let url = URL(string: urlString) else { fatalError("Incorrect link") }
            let task = URLSession.shared.dataTask(with: url) { data, _ , error in
                if let data = data, error == nil {
                    if let nowPlayingMovieList = parseJSON(data) {
                        delegate?.didUpdateMovieList(with: nowPlayingMovieList)
                    } else {
                        delegate?.didFailWithError(error!)
                    }
                } else {
                    delegate?.didFailWithError(error!)
                }
            }
            task.resume()
        }
        
    }

func parseJSON(_ data: Data) -> [NowPlayingMovieModel]? {
    var nowPlayingMovieList: [NowPlayingMovieModel] = []
    do {
        let decodedData = try JSONDecoder().decode(NowPlayingMovieData.self, from: data)
        for movie in decodedData.results {
            let nowPlayingMovieModel = NowPlayingMovieModel(backdropPath: movie.backdrop_path, id: movie.id, genreIds:movie.genre_ids, overview: movie.overview, posterPath: movie.poster_path, title: movie.title, releaseDate: movie.release_date)
                nowPlayingMovieList.append(nowPlayingMovieModel)
        }
    } catch {
        print(error)
        return nil
    }
    return nowPlayingMovieList
    
}
