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
    
    let viewModel: PhotosViewModel
    let user: UserObject

    var body: some View {
        ScrollView {
            VStack {
                CollectionView(user: user, viewModelPhotos: viewModel)
            }
        }
    }
}

struct CollectionView: View {
    
    @State var isPressed = false
    private let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 15)
    ]
    var user: UserObject
    @ObservedObject var viewModelPhotos: PhotosViewModel

    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModelPhotos.photos.indices, id: \.self) { photoIndex in
                    NavigationLink {
                        ExtendedPhotoView(photosViewModel: viewModelPhotos, user: user, photoIndex: photoIndex)
                    } label: {
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
            }
        }.onAppear {
            viewModelPhotos.fetchPhotos(ownerID: user.id)
        }
    }
}



