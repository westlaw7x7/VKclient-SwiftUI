//
//  PhotoFriendsCell.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 04.03.2022.
//

import SwiftUI
import Kingfisher

struct PhotosHeightPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct PhotoFriendsCell: View {
    
    @State var isPressed = false
    let URL: String
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                KFImage(Foundation.URL(string: URL))
                    .cancelOnDisappear(true)
                    .resizable()
//                    .frame(width: proxy.size.width)
                Image(systemName: isPressed ? "suit.heart.fill" : "suit.heart")
                    .animation(.linear, value: isPressed)
                    .font(.system(size: 25))
                    .onTapGesture {
                        self.isPressed.toggle()
                    }
                    .foregroundColor(isPressed ? .red: .white)
                
            }.preference(key: PhotosHeightPreferenceKey.self, value: proxy.size.width)
        }
        
    }
}


//    var body: some View {
//
//                if let images = viewModelPhotos.photos[photoIndex].sizes["x"] {
//                    KFImage(URL(string: images))
////                AsyncImage(url: URL(string: images )) { image in
////                    image
//                        .resizable()
//                        .scaledToFit()
//                }
//
//            Image(systemName: isPressed ? "suit.heart.fill" : "suit.heart")
//                .animation(.linear, value: isPressed)
//                .font(.system(size: 25))
//                .onTapGesture {
//                    self.isPressed.toggle()
//                }
//                .foregroundColor(isPressed ? .red: .white)
//    }




