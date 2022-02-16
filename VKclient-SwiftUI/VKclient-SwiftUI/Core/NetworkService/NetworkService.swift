//
//  NetworkService.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 16.02.2022.
//

import Foundation

final class NetworkService {
    
    private let url: String = "https://api.vk.com/method"
    private let apiVersion: String = "5.92"
    // MARK: Network configuration/session
    let session = URLSession.shared
    var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        return constructor
    }()
    
    
    func loadUsers(token: String, completion: @escaping([UserObject]) -> Void) {
        
        urlConstructor.path = "/friends.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "order", value: "random"),
            URLQueryItem(name: "fields", value: "nickname, photo_100"),
            URLQueryItem(name: "v", value: apiVersion)
        ]
        guard let url = urlConstructor.url else { return }
        var request = URLRequest(url: url)
        request.timeoutInterval = 50.0
        request.setValue("", forHTTPHeaderField: "Token")
        
        session.dataTask(with: request) { responseData, urlResponse, error in
            if let response = urlResponse as? HTTPURLResponse {
                print(response.statusCode)
            } else { return completion([])}
            guard
                error == nil,
                let responseData = responseData else
                { return completion([])}
            do {
                let user = try JSONDecoder().decode(UserResponse.self,
                                                    from: responseData).response.items
                let userRealm = user.map { UserRealm(user: $0) }
                try RealmService.save(items: userRealm)
                
                DispatchQueue.main.async {
                    completion(user)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
}





