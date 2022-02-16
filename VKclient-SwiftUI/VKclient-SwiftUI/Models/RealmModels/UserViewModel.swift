//
//  UserViewModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 16.02.2022.
//

import Foundation

class UserViewModel: ObservableObject, Identifiable {
    
    let id = UUID()
    
   @Published var users: [UserObject] = []
    
    let networkService = NetworkService()
//
//    init(users: [UserObject], networkService: NetworkService) {
//        self.users = users
//        self.networkService = networkService
//    }
    
    public func fetchUsers() {
        guard let token = UserDefaults.standard.string(forKey: "vkToken") else { return }
        
        networkService.loadUsers(token: token) { [weak self] users in
            guard let self = self else { return }
            self.users = users
        }
    }
}
