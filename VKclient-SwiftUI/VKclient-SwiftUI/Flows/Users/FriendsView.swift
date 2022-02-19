//
//  FriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI
import Kingfisher

struct FriendsView: View {
    
    @State var groupedArray: [String: [UserObject]] = [:]
//    @State var groupedArray: [String: [UserViewModel]] = [:]
    
    @ObservedObject var viewModel: UserViewModel 
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List() {
            ForEach(viewModel.users, id: \.self) { user in
        NavigationLink {
//            PhotoFriendsView(viewModel: viewModel)
        } label: {
            VStack {
                        HStack {
                            KFImage(URL(string: user.avatar))
                            TextBuilder {
                                Text("\(user.firstName) \(user.lastName)")
                            }
                        }
                    }
            }
        }
        }.onAppear(perform: viewModel.fetchUsers)
    }
}
    
//    MARK: View with sections for each first letter of the surName
//    var body: some View {
//        NavigationLink {
//            PhotoFriendsView()
//        } label: {
//            VStack {
//                List() {
//                    ForEach(groupedArray.keys.sorted(), id: \.self) { key in
//                        Section(header: Text(key)) {
//                            ForEach(groupedArray[key]!, id: \.self) { value in
//                                HStack {
//                                    KFImage(URL(string: value.avatar))
//                                    TextBuilder {
//                                        Text("\(value.firstName) \(value.lastName)")
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//                .listStyle(PlainListStyle())
//                .onAppear {
//                    viewModel.fetchUsers()
//                    groupedArray = Dictionary(
//                        grouping: viewModel.users,
//                        by: {$0.lastName.first?.uppercased() ?? ""}
//                    ).mapValues{$0.sorted(by:{ $0.lastName < $1.lastName })}
//
//
//
//                }
//
//
//
//            }
//        }
//    }
//}
//
struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = UserViewModel()
        FriendsView(viewModel: viewModel)
    }
}
