//
//  GroupsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI
import Kingfisher

struct GroupsView: View {
    
    let groupsViewModel: GroupViewModel
    
    var body: some View {
        List(groupsViewModel.detachedGroups, id: \.self) { groups in
            NavigationLink {
                SearchGroupView()
            } label: {
                VStack {
                    HStack {
                        KFImage(URL(string: groups.photo))
                        //                            Image(uiImage: group.)
                        TextBuilder {
                            Text(groups.name)
                        }
                    }
                }
            }
        }.onAppear {
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
