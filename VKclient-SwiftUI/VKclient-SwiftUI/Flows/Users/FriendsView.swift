//
//  FriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI
import Network

struct FriendsView: View {
    
    @ObservedObject var viewModel: UserViewModel
    @State var searchText = ""
    let viewPhotosModel = PhotosViewModel()
    let user = UserObject()
    private var searchResult: [UserObject] {
        if searchText.isEmpty {
            return viewModel.users
        } else {
            return viewModel.users.filter { user in
                "\(user.lastName) \(user.firstName)".contains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List(searchResult.indices, id: \.self) { index in
                NavigationLink {
                    PhotoFriendsView(viewModel: viewPhotosModel, user: searchResult[index])
                } label: {
                    FriendsCell(searchResult: searchResult[index])
                }
            }.onAppear(perform: viewModel.fetchUsers)
                .listStyle(.plain)
        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}
