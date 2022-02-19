//
//  PhotoFriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 13.02.2022.
//

import SwiftUI
import QGrid
import Kingfisher


struct PhotoFriendsView: View {
    private let items = 1 ... 3
    private let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 15)
    ]
    
  
    var body: some View {
        
        VStack {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(items, id: \.self) { photos in
                    Image("\(photos)")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
    }
}

//struct PhotoFriendsView: View {
//
//    @ObservedObject var viewModel: UserViewModel
//
//    init(viewModel: UserViewModel) {
//        self.viewModel = viewModel
//    }
//
//    var body: some View {
//        QGrid(viewModel, columns: 3) { model in
//            GridCell(user: model)
//        }
//    }
//}
//
//struct GridCell: View {
//
//    let user: UserViewModel
//
//    var body: some View {
//        ForEach(user.users, id: \.self) { u in
//
//        VStack() {
//            KFImage(URL(string: u.avatar))
//                .resizable()
//                .scaledToFill()
//                .frame(width: 100,
//                       height: 100,
//                       alignment: .leading)
//                .clipShape(Circle())
//
//            TextBuilder {
//                Text(u.firstName)
//            }
//        }
//        }
//    }
//}

//struct PhotoFriendsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoFriendsView()
//    }
//}
