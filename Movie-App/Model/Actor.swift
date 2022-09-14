//
//  Actor.swift
//  Movie-App
//
//  Created by Omar Salem on 12/09/2022.
//

import Foundation


var actors: [Actor] = [] {
    didSet {
        NotificationCenter.default.post(name: Notification.Name("actorsUpdated"), object: nil)
    }
}
struct Actor: Codable {
    let actorID: Int
    let actorName: String
    let actorImageURL: String
    let age, height: String
    let actorMovies: [Movie]

    enum CodingKeys: String, CodingKey {
        case actorID = "actorId"
        case actorName
        case actorImageURL = "actorImageUrl"
        case age, height, actorMovies
    }
}
