//
//  TabViewVK.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 12.02.2022.
//

import SwiftUI

struct TabViewVK: View {
    
    private let pageTitles = ["Friends", "Groups", "News"]
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection, content: {
            let viewModel = UserViewModel()
            FriendsView(viewModel: viewModel)
                .tabItem {
                    Label("Friends", systemImage: "person")
                    Text(pageTitles[0])
                }.tag(0)
            GroupsView()
                .tabItem {
                    Label("Groups", systemImage: "rectangle.3.group.bubble.left")
                    Text(pageTitles[1])
                } .tag(1)
            NewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                    Text(pageTitles[2])
                } .tag(2)
            
        })  .navigationTitle(Text(pageTitles[selection]))
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewVK()
    }
}
