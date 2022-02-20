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
    
    @ObservedObject var viewModelPhotos: PhotosViewModel
    var user: UserObject
    
    var body: some View {
        ScrollView {
            VStack {
                CollectionView(user: user, viewModelPhotos: viewModelPhotos)
            }
        }
    }
    
    struct CollectionView: View {
        
        var user: UserObject
        @ObservedObject var viewModelPhotos: PhotosViewModel
        
        
        private let columns = [
            GridItem(.adaptive(minimum: 100), spacing: 15)
        ]
        
        var body: some View {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(viewModelPhotos.photos, id: \.self) { elements in
                    
                    KFImage(URL(string: elements.sizes["x"]!))
                        .resizable()
                        .scaledToFit()
                }
            }
            .onAppear {
                viewModelPhotos.fetchPhotos(ownerID: user.id)
            }
        }
    }
}
