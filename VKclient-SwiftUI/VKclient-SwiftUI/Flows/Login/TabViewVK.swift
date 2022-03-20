//
//  TabViewVK.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 12.02.2022.
//

import SwiftUI

struct TabViewVK: View {
    @State private var searchText = ""
    let friendsViewModel = UserViewModel()
    let photoViewModel = PhotosViewModel()
    let groupsViewModel = GroupViewModel()
    
    private let pageTitles = ["Friends", "Groups", "News"]
    @State private var selection = 0
    
    var body: some View {
        NavigationView {
        TabView(selection: $selection, content: {
       
                FriendsView(viewModel: friendsViewModel)
                    .tabItem {
                        Label("Friends", systemImage: "person")
                        Text(pageTitles[0])
                    }.tag(0)
                GroupsView(groupsViewModel: groupsViewModel)
                    .tabItem {
                        Label("Groups", systemImage: "rectangle.3.group.bubble.left")
                        Text(pageTitles[1]).bold()
                    } .tag(1)
                NewsView()
                    .tabItem {
                        Label("News", systemImage: "newspaper")
                        Text(pageTitles[2]).bold()
                    } .tag(2)
        
        }).navigationTitle(Text(pageTitles[selection]))
        }
               
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewVK()
    }
}
