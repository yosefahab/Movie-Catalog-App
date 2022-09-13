//
//  NetworkClient.swift
//  Movie-App
//
//  Created by Youssef Ahab on 13/09/2022.
//

import Foundation


enum NetworkError: Error {
    case invalidResponse
}

class NetworkClient {

    let baseURL: String = "https://our-movie-service.herokuapp.com/"

    static func getMovies(url: URL) async throws -> [Movie] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        let newMovies: [Movie] = try JSONDecoder().decode([Movie].self, from: data)
        return newMovies
    }

    static func getActor(withID: String, from url: URL) async throws -> Actor {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        let actor: Actor = try JSONDecoder().decode(Actor.self, from: data)
        return actor
    }
}
