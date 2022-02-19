//
//  NewsModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 16.02.2022.
//

//import Foundation
//import SwiftyJSON
//
//protocol NewsSource {
//    
//    var name: String { get }
//    var urlString : String { get }
//}
//
//extension NewsSource {
//    var urlImage: URL? { URL(string: urlString)}
//}
//
//class PostNews {
//    var sourceID: Int
//    var date: Date
//    var text: String
//    var postID: Double
//    var likes: Int
//    var comments: Int
//    var reposts: Int
//    var type: String
//    var views: Int
//    var url: URL? { urlString.flatMap { URL(string: $0) }}
//    var urlString: String?
//    var nextFrom: String
//    var width: Float
//    var height: Float
//    var aspectRatio: Float { width/height }
//    
//    var urlProtocol: NewsSource?
//    
//    var rowsCounter: [NewsTypes] {
//        var rowsCounter = [NewsTypes]()
//        
//        rowsCounter.append(.header)
//        
//
//        if !text.isEmpty {
//            rowsCounter.append(.text)
//        }
//        
//        
//        if urlString != nil {
//            rowsCounter.append(.photo)
//        }
//        
//        rowsCounter.append(.footer)
//        
//        return rowsCounter
//    }
//    
//    init(_ json: JSON) {
//        self.sourceID = json["source_id"].intValue
//        self.date = Date(timeIntervalSince1970: (json["date"].doubleValue))
//        self.text = json["text"].stringValue
//        self.postID = json["post_id"].doubleValue
//        self.likes = json["likes"]["count"].intValue
//        self.comments = json["comments"]["count"].intValue
//        self.reposts = json["reposts"]["count"].intValue
//        self.views = json["views"]["count"].intValue
//        self.type = json["type"].stringValue
//        self.nextFrom = json["next_from"].stringValue
//
//        
//        self.urlString = json["attachments"].arrayValue.first(where: { $0["type"] == "photo" })?["photo"]["sizes"].arrayValue.last?["url"].stringValue
//        self.height = json["attachments"].arrayValue.first(where: { $0["type"] == "photo" })?["photo"]["sizes"].arrayValue.last?["height"].floatValue ?? 0
//        self.width = json["attachments"].arrayValue.first(where: { $0["type"] == "photo" })?["photo"]["sizes"].arrayValue.last?["width"].floatValue ?? 0
//    }
//}
