//
//  PhotoFriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 13.02.2022.
//

//import SwiftUI
//import QGrid
//
//struct PhotoFriendsView: View {
//    var body: some View {
//        QGrid(users, columns: 3) { user in
//            GridCell(user: user)
//        }
//    }
//}
//
//struct GridCell: View {
//    
//    let user: User
//    
//    var body: some View {
//        VStack() {
//            Image(uiImage: user.image)
//                .resizable()
//                .scaledToFill()
//                .frame(width: 100,
//                       height: 100,
//                       alignment: .leading)
//                .clipShape(Circle())
//            
//            TextBuilder {
//                Text(user.name)
//            }
//        }
//    }
//}
//
//struct PhotoFriendsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoFriendsView()
//    }
//}
