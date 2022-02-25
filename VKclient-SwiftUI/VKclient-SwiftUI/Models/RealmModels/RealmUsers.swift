//
//  RealmUsers.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 16.02.2022.
//

import RealmSwift
import UIKit

class RealmUsers: Object, Identifiable {
    let uniqueID = UUID()
    @Persisted var firstName: String = ""
    @Persisted var lastName: String = ""
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var avatar: String = ""
}

extension RealmUsers {
    convenience init(user: UserObject){
        self.init()
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.id = user.id
        self.avatar = user.avatar
    }
}
