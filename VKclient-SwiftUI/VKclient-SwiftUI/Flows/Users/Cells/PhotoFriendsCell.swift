//
//  PhotoFriendsCell.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 04.03.2022.
//

import SwiftUI
import Kingfisher

struct PhotoFriendsCell: View {
    
    @State var isPressed = false
    let viewModelPhotos: PhotosViewModel
    let photoIndex: Int
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            KFImage(URL(string: viewModelPhotos.photos[photoIndex].sizes["x"]!))
                .resizable()
                .scaledToFit()
            
            Image(systemName: isPressed ? "suit.heart.fill" : "suit.heart")
                .animation(.linear, value: isPressed)
                .font(.system(size: 25))
                .onTapGesture {
                    self.isPressed.toggle()
                }
                .foregroundColor(isPressed ? .red: .white)
            
        } 
    }
}



