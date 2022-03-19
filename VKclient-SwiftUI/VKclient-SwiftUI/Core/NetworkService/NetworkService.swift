//
//  NetworkService.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 16.02.2022.
//

import Foundation

final class NetworkService {
    
    private let url: String = "https://api.vk.com/"
    private let apiVersion: String = "5.92"
    private let realmService = RealmService()
    
    // MARK: Network configuration/session
    let session = URLSession.shared
    var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        return constructor
    }()
    
    func loadUsers(token: String, completion: @escaping([UserObject]) -> Void) {
        
        urlConstructor.path = "/method/friends.get"
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
                DispatchQueue.main.async {
                    completion(user)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func loadPhotos(token: String, ownerID: Int, completion: @escaping ([PhotosObject]) -> Void) {
        
        urlConstructor.path = "/method/photos.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "rev", value: "1"),
            URLQueryItem(name: "owner_id", value: "\(ownerID)"),
            URLQueryItem(name: "album_id", value: "profile"),
            URLQueryItem(name: "offset", value: "0"),
            URLQueryItem(name: "photo_sizes", value: "0"),
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
                let photos = try JSONDecoder().decode(PhotosResponse.self,
                                                      from: responseData).response.items
                
                let photosRealm = photos.map { RealmPhotos(photos: $0) }
                
                DispatchQueue.main.async {
                    try? self.realmService.save(items: photosRealm)
                    completion(photos)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func loadGroups(token: String,  completion: @escaping([GroupsObjects]) -> Void) {
        
        urlConstructor.path = "/method/groups.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "photo_100"),
            URLQueryItem(name: "v", value: apiVersion),
        ]
        
        guard let url = urlConstructor.url else { return completion([])}
        var request = URLRequest(url: url)
        request.timeoutInterval = 50.0
        request.setValue(
            "",
            forHTTPHeaderField: "Token")
        
        session.dataTask(with: request) { responseData, urlResponse, error in
            if let response = urlResponse as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard
                error == nil,
                let responseData = responseData
            else { return completion([])}
            do {
                let groups = try JSONDecoder().decode(GroupsResponse.self,
                                                      from: responseData).response.items
                DispatchQueue.main.async {
                    completion(groups)
                }
                
            } catch {
                print(error)
            }
        }
        .resume()
    }
}




