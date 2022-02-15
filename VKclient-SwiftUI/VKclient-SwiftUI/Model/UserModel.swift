//
//  UserModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import Foundation
import UIKit

struct User: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let surName: String
    let image: UIImage!
    let age: Int
}

var users: [User] = [
    User(name: "Sylvester", surName: "Stallone", image: UIImage(named: "Sylvester"), age: 75),
    User(name: "Jason", surName: "Statham", image: UIImage(named: "Jason"), age: 54),
    User(name: "Arnold", surName: "Schwarzenegger", image: UIImage(named: "Arnold"), age: 74),
    User(name: "Nikolay", surName: "Kletkin", image: UIImage(named: "Колян"), age: 58),
    User(name: "Elon", surName: "Musk", image: UIImage(named: "Elon"), age: 50)
]


