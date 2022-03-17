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
//    let groupsViewModel: GroupViewModel
//    let coordinator: CoordinatorObject
    
    var body: some View {
        List(groupsViewModel.detachedGroups, id: \.self) { groups in
//            NavigationLink {
//                SearchGroupView()
//            } label: {
                VStack {
                    HStack {
                        AvatarImage{
                            AsyncImage(url: URL(string: groups.photo))
                        }
                        TextBuilder {
                            Text(groups.name)
                        }
                    }
//                }
            }
        }.listStyle(PlainListStyle())
        .onAppear {
            groupsViewModel.fetchGroups()
        }
    }
}


//struct GroupsList_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        GroupsView(groupsViewModel: GroupViewModel)
//    }
//}
