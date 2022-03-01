//
//  FriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI

struct FriendsView: View {
    @State var animationAmount = false
    let user = UserObject()
    let viewPhotosModel = PhotosViewModel()
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
    @ObservedObject var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(searchResult, id: \.self) { user in
                    NavigationLink {
                        PhotoFriendsView(user: user, viewModelPhotos: viewPhotosModel)
                    } label: {
                        VStack {
                            HStack {
                                AvatarImage {
                                    AsyncImage(url: URL(string: user.avatar))
                                }
                                .scaleEffect(animationAmount ? 1.2 : 1)
                                    .animation(.spring(response: 0.4, dampingFraction: 0.6))
                                    .onTapGesture {
                                        animationAmount = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            animationAmount = false
                                        }
                                    }
                                    TextBuilder {
                                    Text("\(user.firstName) \(user.lastName)")
                                }
                            }
                            
                            
                        }
                    }
                }
               
                    
            }.onAppear(perform: viewModel.fetchUsers)
              
                
        }.searchable(text: $searchText)
            .navigationBarHidden(true)
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

