//
//  TabViewVK.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 12.02.2022.
//

import SwiftUI

struct TabViewVK: View {
    var body: some View {
        
        TabView {
            FriendsView()
                .tabItem {
                   Label("Friends", systemImage: "person")
                }
            GroupsView()
                .tabItem {
                    Label("Groups", systemImage: "rectangle.3.group.bubble.left")
                }
            NewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
        }
    
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewVK()
    }
}
