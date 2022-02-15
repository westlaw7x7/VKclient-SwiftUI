//
//  GroupModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import Foundation
import UIKit

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
