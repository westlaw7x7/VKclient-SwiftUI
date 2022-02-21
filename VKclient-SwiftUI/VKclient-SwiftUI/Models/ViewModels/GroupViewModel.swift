//
//  GroupViewModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 16.02.2022.
//

import Foundation
import SwiftUI
import RealmSwift

class GroupViewModel: ObservableObject {
    
    let token = Auth.instance.token
    let networkService = NetworkService()
    let realmService = RealmService()
    let objectWillChange = ObjectWillChangePublisher()
    
    private(set) lazy var groups: Results<RealmGroups>? = try? realmService.get(RealmGroups.self, configuration: .deleteIfMigration)
    
    var detachedGroups: [RealmGroups] { groups?.map { $0.detached() } ?? [] }
    
    private var notificationToken: NotificationToken?
    
    public func fetchGroups() {
        networkService.loadGroups(token: token) { [weak self] groups in
            
            let groupRealm = groups.map { RealmGroups(groups: $0) }
            do {
                try? self?.realmService.save(items: groupRealm)
            }
        }
    }
}


