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
    static let baseURL: String = "https://our-movie-service.herokuapp.com/"
    
    static func requestMovies(url: URL) async throws -> [Movie] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        let newMovies: [Movie] = try JSONDecoder().decode([Movie].self, from: data)
        return newMovies
    }

    static func requestActor(withID: String, from url: URL) async throws -> Actor {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        let actor: Actor = try JSONDecoder().decode(Actor.self, from: data)
        return actor
    }
    
    static func requestLogin(email: String, password: String) -> User {
        let loginURL: String = baseURL + "Users/login"
        let user = User(email: "", username: "", password: "")
        return user
        //    {
        //        "email": "string",
        //        "password": "string"
        //    }
    }
    
    static func requestRegister(username: String, email: String, password: String) -> User {
        let signUpURL: String = baseURL + "Users/register"
        let user = User(email: "", username: "", password: "")
        return user
        //    {
        //        "username": "string"
        //        "email": "string"
        //        "password": "string"
        //    }
    }
}
