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

      @ObservedObject var viewModel: UserViewModel
      let user = UserObject()
      let viewPhotosModel = PhotosViewModel()
      
      init(viewModel: UserViewModel) {
          self.viewModel = viewModel
      }
    
    var body: some View {
          List() {
              ForEach(viewModel.users) { user in
          NavigationLink {
              PhotoFriendsView(user: user, viewModelPhotos: viewPhotosModel)
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

//MARK: Sections, but View doesn't update properly + navigation link isn't working.
//      var body: some View {
//          List() {
//              ForEach(groupedArray.keys.sorted(), id: \.self) { key in
//                  Section(header: Text(key)) {
//                  ForEach(groupedArray[key]!, id: \.self) { value in
//          NavigationLink {
//              PhotoFriendsView(user: user, viewModelPhotos: viewPhotosModel)
//          } label: {
//
//                          HStack {
//                              KFImage(URL(string: value.avatar))
//                              TextBuilder {
//                                  Text("\(value.firstName) \(value.lastName)")
//                              }
//                          }
//                          }
//
//                  }
//              }
//          }
//          }
//              .onAppear {
//                  viewModel.fetchUsers()
//                  groupedArray = Dictionary(grouping: viewModel.users,
//                                          by: {$0.lastName.first?.uppercased() ?? ""}
//                                      ).mapValues{$0.sorted(by:{ $0.lastName < $1.lastName })}
//              }
//      }
//  }

    


//struct FriendsList_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = UserViewModel()
//        FriendsView(viewModel: viewModel)
//    }
//}
