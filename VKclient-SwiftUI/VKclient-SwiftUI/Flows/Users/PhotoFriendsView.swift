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
    
    var user: UserObject
    @ObservedObject var viewModelPhotos: PhotosViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                CollectionView(user: user, viewModelPhotos: viewModelPhotos)
            }
        }
    }
}

struct CollectionView: View {
    
    private let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 15)
    ]
    var user: UserObject
    @ObservedObject var viewModelPhotos: PhotosViewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModelPhotos.photos, id: \.self) { elements in
            NavigationLink {
                ExtendedPhotoView(photosViewModel: viewModelPhotos, user: user)
            } label: {
                
                ZStack {
                    KFImage(URL(string: elements.sizes["x"]!))
                        .resizable()
                        .scaledToFit()
                    VStack {
                        Spacer()
                    Image(systemName: "suit.heart")
                        .font(.system(size: 45))
                        .foregroundColor(.gray)
                        .padding(.leading, 5)
                }
                }
               
                    }
                }
            }
        }
        .onAppear {
            viewModelPhotos.fetchPhotos(ownerID: user.id)
        }
    }
}


