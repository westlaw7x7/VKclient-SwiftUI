//
//  PhotosModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 16.02.2022.
//

import Foundation
import RealmSwift
import UIKit

struct PhotosResponse: Decodable {
    let response: Response
}

struct Response: Decodable {
    var count: Int = 0
    let items: [PhotosObject]
}

struct PhotosObject: Decodable, Hashable, Identifiable {
    let uniqueID = UUID()
    var id: Int = 0
    var ownerID: Int = 0
    var sizes = Map<String, String>()
    var serialNumber: String = ""
    func hash(into hasher: inout Hasher) {
        hasher.combine(serialNumber)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
    }
    
    enum PhotoKeys: String, CodingKey {
        case height, url, type, width
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.ownerID = try values.decode(Int.self, forKey: .ownerID)
        
        var photosValue = try values.nestedUnkeyedContainer(forKey: .sizes)
        
        while !photosValue.isAtEnd {
            let photo = try photosValue.nestedContainer(keyedBy: PhotoKeys.self)
            let photoType = try photo.decode(String.self, forKey: .type)
            let photoURL = try photo.decode(String.self, forKey: .url)
            sizes[photoType] = photoURL
        }
    }
}
