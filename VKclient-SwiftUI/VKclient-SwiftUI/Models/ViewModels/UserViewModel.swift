//
//  UserViewModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 16.02.2022.
//

import Foundation
import RealmSwift

class UserViewModel: ObservableObject, Identifiable {
    
    let id = UUID()
    let networkService = NetworkService()
    let token = Auth.instance.token
    @Published var users: [UserObject] = []
    @Published var usersDict: [String: [UserObject]] = [:]
    
    public func fetchUsers() {
        networkService.loadUsers(token: token) { [weak self] users in
            guard let self = self else { return }
                self.users = users
        }
    }
    
    public func reloadView() {
        objectWillChange.send()
    }
}
