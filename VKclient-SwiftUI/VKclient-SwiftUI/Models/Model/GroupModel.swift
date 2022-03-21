//
//  GroupModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import Foundation
import UIKit

struct GroupsResponse: Decodable {
    var response: GroupsNextResponse
    
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct GroupsNextResponse: Decodable {
    var count: Int = 0
    var items: [GroupsObjects]
    
    enum CodingKeys: String, CodingKey {
        case count, items
    }
}

struct GroupsObjects: Decodable {
    var name: String = ""
    var id: Int = 0
    var photo: String = ""
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case id = "id"
        case photo = "photo_100"
    }
}

struct Group: Identifiable {
    
    let name: String
    let image: UIImage!
    let id = UUID()
}

var groups: [Group] = [
    Group(name: "Apple fan", image: UIImage(named: "Apple")),
    Group(name: "World of Warcraft", image: UIImage(named: "WoW")),
    Group(name: "News today", image: UIImage(named: "News")),
    Group(name: "Finance", image: UIImage(named: "Finance"))
]
