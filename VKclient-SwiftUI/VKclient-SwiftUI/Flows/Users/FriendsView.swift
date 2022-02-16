//
//  FriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI

struct FriendsView: View {
//    @State var groupedArray: [String: [User]] = [:]
    
    @ObservedObject var viewModel: UserViewModel
    @State var groupedArray: [String: [UserObject]] = [:]
    
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationLink {
//            PhotoFriendsView()
            EmptyView()
        } label: {
            List() {
                ForEach(groupedArray.keys.sorted(), id: \.self) {key in
                    Section(header: Text(key)) {
                        ForEach(groupedArray[key]!, id: \.self) {value in
                            HStack{
                                AvatarImage {
                                    Image(uiImage: UIImage(named: value.avatar)!)
                                }
                                TextBuilder {
                                    Text("\(value.firstName) \(value.lastName)")
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchUsers()
                groupedArray = Dictionary(
                    grouping: viewModel,
                    by: {$0.lastName.first?.uppercased() ?? ""}
                ).mapValues{$0.sorted(by:{ $0.lastName < $1.lastName })}
            }
        }
    }
}

//    var body: some View {
//
//        VStack {
//                 List(users) { users in
//                     HStack {
//                         AvatarImage {
//                             Image(uiImage: users.image)
//                         }
//                         TextBuilder {
//                             Text("\(users.name) \(users.surName)")
//                         }
//                     }
//                 }
//             }
//         }


    
//    var body: some View {
//        NavigationLink {
////            PhotoFriendsView()
//            EmptyView()
//        } label: {
//            List() {
//                ForEach(groupedArray.keys.sorted(), id: \.self) {key in
//                    Section(header: Text(key)) {
//                        ForEach(groupedArray[key]!, id: \.self) {value in
//                            HStack{
//                                AvatarImage {
//                                    Image(uiImage: value.image)
//                                }
//                                TextBuilder {
//                                    Text("\(value.name) \(value.surName)")
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            .onAppear {
//                groupedArray = Dictionary(
//                    grouping: users,
//                    by: {$0.surName.first?.uppercased() ?? ""}
//                ).mapValues{$0.sorted(by:{ $0.surName < $1.surName })}
//            }
//        }
//    }
//}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = UserViewModel()
        FriendsView(viewModel: viewModel)
    }
}
