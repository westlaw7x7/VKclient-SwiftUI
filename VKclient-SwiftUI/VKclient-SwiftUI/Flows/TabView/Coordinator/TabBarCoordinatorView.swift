//
//  TabBarCoordinatorView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 17.03.2022.
//

import SwiftUI

struct TabBarCoordinatorView: View {
    
    let friendsViewModel = UserViewModel()
    let photoViewModel = PhotosViewModel()
    let groupsViewModel = GroupViewModel()
    
    var body: some View {
        UITabBarWrapper([
            TabBarElement(tabBarElementItem: .init(title: "Friends", systemImageName: "person"), {
                NavigationView {
                    FriendsView(viewModel: friendsViewModel )
                }
            }),
            
            TabBarElement(tabBarElementItem: .init(title: "Groups", systemImageName: "rectangle.3.group.bubble.left"), {
                NavigationView {
                    GroupsView(groupsViewModel: groupsViewModel)
                }
            }),
            
            TabBarElement(tabBarElementItem: .init(title: "News", systemImageName: "newspaper"), {
                NavigationView {
                    NewsView()
                }
            })
        ]).navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
    }
}


