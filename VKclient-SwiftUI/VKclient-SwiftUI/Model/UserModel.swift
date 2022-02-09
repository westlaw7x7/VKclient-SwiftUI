//
//  UserModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import Foundation
import UIKit

struct User: Identifiable {
    
    let id = UUID()
    let name: String
    let surName: String
    let image = UIImage(systemName: "person.circle")!
    let age: Int
}

var users: [User] = [
    User(name: "Ivan", surName: "Degtyarev", age: 20),
User(name: "Jason", surName: "Smith", age: 32),
User(name: "Fred", surName: "Taylor", age: 50)
]


