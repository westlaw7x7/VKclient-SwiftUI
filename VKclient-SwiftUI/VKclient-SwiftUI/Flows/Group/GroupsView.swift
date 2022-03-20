//
//  GroupsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI
import Kingfisher

struct GroupsView: View {
    @ObservedObject var groupsViewModel: GroupViewModel
    @State var searchText = ""
    private var searchResult: [RealmGroups] {
        if searchText.isEmpty {
            return groupsViewModel.detachedGroups
        } else {
            return groupsViewModel.detachedGroups.filter { groups in
                "\(groups.name)".contains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
        List(searchResult, id: \.self) { groups in
            NavigationLink {
                SearchGroupView()
            } label: {
                GroupsCell(groups: groups)
            }
        }.listStyle(PlainListStyle())
            .onAppear {
                groupsViewModel.fetchGroups()
            }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .navigationBarTitleDisplayMode(.large)
    }
}
}
