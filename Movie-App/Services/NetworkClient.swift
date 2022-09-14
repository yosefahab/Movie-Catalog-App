//
//  NetworkClient.swift
//  Movie-App
//
//  Created by Youssef Ahab on 13/09/2022.
//

import Foundation

class NetworkClient {
    static let baseURL: String = "https://our-movie-service.herokuapp.com/"
    
    static func requestMovies() async -> [Movie] {
        let url: URL = URL(string: baseURL + "Movies/getmovies")!
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let newMovies = try JSONDecoder().decode([Movie].self, from: data)
            return newMovies
        } catch {
            print("error in movies")
        }
        return []
    }
    
    static func requestActors() async -> [Actor] {
        let url: URL = URL(string: baseURL + "Actors/getactors")!
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let newActors = try JSONDecoder().decode([Actor].self, from: data)
            return newActors
        } catch {
            print("error in actors")
        }
        return []
    }
    
    static func requestLogin(email: String, password: String) async -> User? {
        let url: URL = URL(string: baseURL + "Users/login")!
        let credentials: [String: String] = ["email": email, "password": password]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let json: Data = try JSONSerialization.data(withJSONObject: credentials, options: [])
            urlRequest.httpBody = json
        } catch {
            print("Error: cannot create JSON from login credentials dictionary")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            if let httpResponse = response as? HTTPURLResponse {
                print("login request w/ status code: \(httpResponse.statusCode)")
                let user = try JSONDecoder().decode(User.self, from: data)
                return user
            }
            else {
                return nil
            }
        } catch {
            print("error in login request/deocde user")
        }
        return nil
    }
    
    
    static func requestRegister(username: String, email: String, password: String) async -> User? {
        let url: URL = URL(string: baseURL + "Users/register")!
        let credentials: [String: String] = ["username": username, "email": email, "password": password]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let json: Data = try JSONSerialization.data(withJSONObject: credentials, options: [])
            urlRequest.httpBody = json
        } catch {
            print("Error: cannot create JSON from register credentials dictionary")
        }
        
        do {
            let (_, response) = try await URLSession.shared.data(from: url)
            if let httpResponse = response as? HTTPURLResponse {
                print("register request w/ status code: \(httpResponse.statusCode)")
                return User(id: nil, email: email, username: username, password: password, userFavourite: [])
            }
            else {
                return nil
            }
        } catch {
            print("error in register request/deocde user")
        }
        return nil
    }

    static func downloadImage(from url: URL) {
       
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            DispatchQueue.main.async() { [weak self] in
//            }
//        }
    }
}
