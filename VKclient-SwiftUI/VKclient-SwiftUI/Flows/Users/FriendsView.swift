//
//  FriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI
import Network

struct FriendsView: View {
    
    let viewPhotosModel = PhotosViewModel()
    let user = UserObject()
    @ObservedObject var viewModel: UserViewModel
    @State var searchText = ""
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

////MARK: Sections, but View doesn't update properly + navigation link isn't working.
    ///
//      var body: some View {
//          NavigationView {
//          List() {
//              ForEach(viewModel.usersDict.keys.sorted(), id: \.self) { key in
//                  Section(header: Text(key)) {
//                      ForEach(viewModel.usersDict[key]!) { value in
//          NavigationLink {
//              PhotoFriendsView(user: user, viewModelPhotos: viewPhotosModel)
//          } label: {
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
//
//          } .onAppear {
//
//             viewModel.fetchUsers()
//
//              viewModel.usersDict = Dictionary(grouping: searchResult,
//                                                  by: {$0.lastName.first?.uppercased() ?? ""}
//                                              ).mapValues{$0.sorted(by:{ $0.lastName < $1.lastName })}
//          }
//          }.searchable(text: $searchText)
//              .navigationBarHidden(true)
//
//              }
//      }

