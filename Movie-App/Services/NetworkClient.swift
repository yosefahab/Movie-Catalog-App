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
    
    static func requestMovies() async throws -> [Movie] {
        let url: URL = URL(string: baseURL + "Movies/getmovies")!
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        let newMovies: [Movie] = try JSONDecoder().decode([Movie].self, from: data)
        print("Error: " + String(newMovies.count))
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
    
    static func requestLogin(email: String, password: String) async throws -> Void {
        let url: URL = URL(string: baseURL + "Users/login")!
        var user: User?
        let credentials: [String: String] = ["email": email, "password": password]
        user = await self.postRequest(to: url, withData: credentials)
    }
    
    static func requestRegister(username: String, email: String, password: String) async -> Void {
        let url: URL = URL(string: baseURL + "Users/register")!
        var user: User?
        let credentials: [String: String] = ["username": username, "email": email, "password": password]
        user = await self.postRequest(to: url, withData: credentials)
    }

    private static func postRequest(to url: URL, withData credentials: [String : String]) async -> User? {
        var user: User?
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let json: Data = try JSONSerialization.data(withJSONObject: credentials, options: [])
            urlRequest.httpBody = json
        } catch {
            print("Error: cannot create JSON from credentials dictionary")
            return nil
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                print("Error: couldn't call POST")
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            print("Error: " + String(responseData.count))
            let decoder = JSONDecoder()
            
            do {
                user = try decoder.decode(User.self, from: responseData)
                print(user!)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        return user
    }
//        func downloadImage(from url: URL) {
//            getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            // always update the UI from the main thread
//            DispatchQueue.main.async() { [weak self] in
//                self?.imageView.image = UIImage(data: data)
//            }
//        }
//    }
}
