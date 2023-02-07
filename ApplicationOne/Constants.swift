//
//  Constants.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 28.01.2023.
//

import Foundation
<<<<<<< HEAD
import SnapKit

struct Constants {
=======

struct Constants {
    
    struct Keys {
            static let api = "7becb73ba1e1ce4565bddcd0f7fdb23e"
        
    }
        
>>>>>>> 784b82f (added now playing)
    struct Identifiers {
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let trendingCollectionViewCell = "TrendingCollectionView"
        static let categoryTableViewCell = "CategoryTableViewCell"
        static let placesTableViewCell = "PlacesTableViewCell"
        static let placesCollectionViewCell = "PlacesCollectionViewCell"
        static let categoryCollectionViewCell2 = "CategoryCollectionViewCell2"
<<<<<<< HEAD
=======
        static let movieCollectionViewCell = "MovieCollectionViewCell"
    }
    struct Values {
        static let urlList = [URLs.trending, URLs.nowPlaying, URLs.popular, URLs.topRated, URLs.upcoming]
        
    }
    struct Colors {
        
    }
    struct Links {
            static let api = "https://api.themoviedb.org/3/"
            static let image = "https://image.tmdb.org/t/p/w500/" // + poster path
    }
    
    struct URLs {
        static let trending = "\(Links.api)trending/movie/day?api_key=\(Keys.api)"
        static let nowPlaying = "\(Links.api)movie/now_playing?api_key=\(Keys.api)"
        static let popular = "\(Links.api)movie/popular?api_key=\(Keys.api)"
        static let topRated = "\(Links.api)movie/top_rated?api_key=\(Keys.api)"
        static let upcoming = "\(Links.api)movie/upcoming?api_key=\(Keys.api)"
        
>>>>>>> 784b82f (added now playing)
    }
    
    enum Places: String, CaseIterable {
            case all = "🔥Все"
<<<<<<< HEAD
            case cinema = "🎬Кинотеатры"
=======
            case cinema = "🎬Кино"
>>>>>>> 784b82f (added now playing)
            case concerts = "🎙️Концерты"
            case inTheaters = "🎭Театр"
            case sport = "⚽️Спорт"
            case other = "🧩Другое"
<<<<<<< HEAD
          }
    
    struct Colors {
=======
>>>>>>> 784b82f (added now playing)
        
    }
    
    enum Category: String, CaseIterable {
<<<<<<< HEAD
        case all = "🔥All"
        case streaming = "🎥Streaming"
        case onTV = "📺On TV"
        case inTheaters = "🍿In Theaters"
=======
        case nowPlayng = "🔥Now Playing"
        case popular = "🎥Popular"
        case topRated = "📺Top Rated"
        case upcoming = "🍿 Upcoming"
>>>>>>> 784b82f (added now playing)
    }
    
    struct Info {
        static func allDataCell() -> [Data] {
            [
                .init(name: "Cinemax Dostyk Multiplex", address: "Самал-2, д. 111, уг.ул. Жолдасбекова, ТРЦ «Достык Плаза»", imageName: "cinemax"),
                .init(name: "Lumiera Cinema (ЦУМ)", address: "пр. Абылай хана, 62, «Арбат»", imageName: "lumiera"),
                .init(name: "Kinoforum 10 (ТРЦ Forum)", address: "ул. Сейфуллина, 617, ТРЦ «Forum Almaty», 5-й этаж", imageName: "kinoforum10"),
                .init(name: "Kinopark 11 (Есентай) IMAX", address: "пр. Аль-Фараби, 77/8, ТЦ «Esentai Mall»", imageName: "kinopark11"),
                .init(name: "Chaplin MEGA Alma-Ata", address: "ул. Розыбакиева, 247А, ТРЦ «MEGA Alma-Ata»", imageName: "chaplin"),
                .init(name: "Chaplin MEGA Park", address: "ул. Макатаева, 127, 3-й этаж", imageName: "chaplinpark"),
                .init(name: "Kinopark 5 Premium Forum", address: "ул. Сейфуллина, 617, ТРЦ «Forum Almaty», 3-й этаж", imageName: "kinopark5"),
                .init(name: "Chaplin ADK", address: "ул. Сатпаева, 90 (уг. ул. Тлендиева), ТРК «АDК»", imageName: "adk"),
                .init(name: "Kinopark 8 Moskva", address: "пр. Абая, уг. пр. Алтынсарина, ТРЦ «MOSKVA Metropolitan»", imageName: "kinopark8"),
                .init(name: "Kinopark 5 Atakent", address: "ул. Тимирязева, 42, ТРЦ «Atakent Mall»", imageName: "kinopark5_atakent"),
                .init(name: "Kinopark 6 (Спутник)", address: "м-н Мамыр-1, 8А, ТРК «Спутник», 3-й этаж", imageName: "kinopark6"),
                .init(name: "Kinoplexx 6 Almaty Mall", address: "ул. Жандосова, 83, ТРЦ «Almaty Mall», 3-й этаж", imageName: "kinoplexx6"),
                .init(name: "Kinoplexx 7 Aport", address: "пр. Райымбека, западное напр., до указателя «Апорт», 2-й этаж", imageName: "aport"),
                .init(name: "Kinopark 4 Globus", address: "пр. Абая, 109в, ТРЦ «Globus», 2-й этаж", imageName: "kinopark4"),
                .init(name: "Kinoplexxx Sary Arka", address: "ул. Алтынсарина, 24, уг. пр. Абая", imageName: "kinoplexx7"),
                .init(name: "Арман 3D (пр.Достык)", address: "пр. Достык, 104", imageName: "arman"),
                .init(name: "Цезарь", address: "пр. Назарбаева, 50, уг. ул. Гоголя", imageName: "caesar")
            ]
        }
    }

    struct Data {
        let name: String
        let address: String
        let imageName: String
    }
}
