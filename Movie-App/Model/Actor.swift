//
//  Actor.swift
//  Movie-App
//
//  Created by Omar Salem on 12/09/2022.
//

import Foundation
struct Actor: Codable {
    let id , name , image : String
    let moviesList : [Movie]
}


let actors : [Actor] = [
    Actor(id: "125", name: "will smith", image: "pic", moviesList: [
        Movie(name: "movie1", rating: "5.0", time: "2:30:00", category: "Action", year: "2020", director: "me", isFavourite: true),
        Movie(name: "movie5", rating: "1.0", time: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true)
    ]),
    Actor(id: "125", name: "will smith", image: "pic", moviesList: [
        Movie(name: "movie1", rating: "5.0", time: "2:30:00", category: "Action", year: "2020", director: "me", isFavourite: true),
        Movie(name: "movie5", rating: "1.0", time: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true)
    ]),
    Actor(id: "125", name: "will smith", image: "pic", moviesList: [
        Movie(name: "movie1", rating: "5.0", time: "2:30:00", category: "Action", year: "2020", director: "me", isFavourite: true),
        Movie(name: "movie5", rating: "1.0", time: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true)
    ]),
    Actor(id: "125", name: "will smith", image: "pic", moviesList: [
        Movie(name: "movie1", rating: "5.0", time: "2:30:00", category: "Action", year: "2020", director: "me", isFavourite: true),
        Movie(name: "movie2", rating: "4.0", time: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true),
    ]),
    Actor(id: "125", name: "will smith", image: "pic", moviesList: [
        Movie(name: "movie1", rating: "5.0", time: "2:30:00", category: "Action", year: "2020", director: "me", isFavourite: true),
        Movie(name: "movie2", rating: "4.0", time: "2:30:00", category: "Drama", year: "2020", director: "me", isFavourite: true),
    ])
]
