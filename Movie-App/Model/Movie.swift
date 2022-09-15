//
//  Movie.swift
//  Movie-App
//
//  Created by Youssef Ahab on 12/09/2022.
//

import Foundation

var movies: [Movie] = [] {
    didSet {
        NotificationCenter.default.post(name: Notification.Name("moviesUpdated"), object: nil)
    }
}

var topMovies: [Movie] = [] {
    didSet {
        NotificationCenter.default.post(name: Notification.Name("topMoviesUpdated"), object: nil)
    }
}
var otherMovies: [Movie] = [] {
    didSet {
        NotificationCenter.default.post(name: Notification.Name("otherMoviesUpdated"), object: nil)
    }
}

//var movies: [Movie] = [
//    Movie(name: "movie1", rating: "5.0", time: "2:30:00", category: "Action", year: "2020", director: "me", isFavourite: true),
//    Movie(name: "movie2", rating: "4.0", time: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true),
//    Movie(name: "movie3", rating: "3.0", time: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true),
//    Movie(name: "movie4", rating: "2.0", time: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true),
//    Movie(name: "movie5", rating: "1.0", time: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true)
//]

struct Movie: Codable {
    var movieID: Int?
    var movieName, directorName, movieDuration, movieProductionYear: String?
    var movieCategory: String?
    var movieImageURL: String?
    var movieRating, movieDescription: String?
    var movieVideoURL: String?

    var isFavourite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case movieID = "movieId"
        case movieName, directorName, movieDuration, movieProductionYear, movieCategory
        case movieImageURL = "movieImageUrl"
        case movieRating, movieDescription
        case movieVideoURL = "movieVideoUrl"
    }
}
