//
//  Movie.swift
//  Movie-App
//
//  Created by Youssef Ahab on 12/09/2022.
//

import Foundation

let movies: [Movie] = [
    Movie(name: "movie1", rating: "5.0", duration: "2:30:00", category: "Action", year: "2020", director: "me", isFavourite: true),
    Movie(name: "movie2", rating: "4.0", duration: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true),
    Movie(name: "movie3", rating: "3.0", duration: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true),
    Movie(name: "movie4", rating: "2.0", duration: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true),
    Movie(name: "movie5", rating: "1.0", duration: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true)
]
struct Movie{
    let name, rating, duration, category, year, director: String
    var isFavourite: Bool = true
    
}
