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
    let image = UIImage(systemName: "person.3")!
    let id = UUID()
}

var groups: [Group] = [
Group(name: "Apple fan"),
Group(name: "Star Wars"),
Group(name: "News today"),
Group(name: "Finance")
]
