//
//  PhotoFriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 13.02.2022.
//

import SwiftUI

struct PhotoFriendsView: View {
    
    @ObservedObject var viewModel: PhotosViewModel
    let id: Int
    
    var body: some View {
        CollectionView(viewModelPhotos: viewModel, id: id)
    }
}

struct CollectionView: View {
    
    private let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 15)
    ]
    
    let viewModelPhotos: PhotosViewModel
    let id: Int
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModelPhotos.photos.indices, id: \.self) { photoIndex in
                    NavigationLink {
                        ExtendedPhotoView(photosViewModel: viewModelPhotos, photoIndex: photoIndex)
                    } label: {
                        PhotoFriendsCell(viewModelPhotos: viewModelPhotos, photoIndex: photoIndex)
                    }
                }
            }
        }.onAppear {
            viewModelPhotos.fetchPhotos(ownerID: id)
        }
        
        
    }
}



