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
    @State var isTapped: Bool = false
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
        VStack {
            HStack {
                NavigationView {
                    List(searchResult, id: \.self) { groups in
                        GroupsCell(groups: groups)
                    }.listStyle(PlainListStyle())
                        .onAppear {
                            groupsViewModel.fetchGroups()
                        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                        .navigationBarTitleDisplayMode(.large)
                        .toolbar {
                            NavigationLink {
                               SearchGroupView(viewModel: SearchGroupViewModel())
                            } label: {
                                Image(systemName: "plus.rectangle.on.rectangle")
                                    .frame(width: 120, height: 50)
                            }
                        }
                }
            }
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView(groupsViewModel: GroupViewModel())
    }
}
