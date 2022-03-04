//
//  CoordinatorObject.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 03.03.2022.
//

import SwiftUI

enum CoordinatorTab {
    case one
    case two
    case three
}

class CoordinatorObject: ObservableObject {

    
    @Published var tab = CoordinatorTab.one
    @Published var tabOneViewModel: FriendsView!
    @Published var tabTwoViewModel: GroupsView!
    @Published var tabThreeViewModel: NewsView!
    
    init() {
        
    }
    
}

