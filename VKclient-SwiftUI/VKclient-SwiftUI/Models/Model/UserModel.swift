//
//  UserModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import Foundation
import UIKit

struct UserResponse: Decodable {
    let response: NextResponse
    
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct NextResponse: Decodable {
    var count: Int = 0
    let items: [UserObject]
    
    
    enum CodingKeys: String, CodingKey {
        case count, items
    }
}

struct UserObject: Decodable, Hashable, Identifiable {
    
    let uniqueID = UUID()
    var firstName: String = ""
    var lastName: String = ""
    var id: Int = 0
    var avatar: String = ""
    
    enum CodingKeys: String, CodingKey {
        
        case firstName = "first_name"
        case id = "id"
        case lastName = "last_name"
        case avatar = "photo_100"
        
    }
}


