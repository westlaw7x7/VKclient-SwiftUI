//
//  PhotoFriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 13.02.2022.
//

import SwiftUI

struct PhotoFriendsView: View {
    
    @State private var PhotosRowHeight: CGFloat? = nil
    @ObservedObject var viewModel: PhotosViewModel
    let user: UserObject
    private let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                    ForEach(viewModel.photos.indices, id: \.self) { index in
                        NavigationLink {
                            ExtendedPhotoView(photosViewModel: viewModel, photoIndex: index)
                        } label: {
                            PhotoFriendsCell(URL: viewModel.photos[index].sizes["x"]!)
                                .frame(height: PhotosRowHeight)
                        }
                    }
                }
                
            }
        }.onAppear {viewModel.fetchPhotos(ownerID: user.id)}
            .onPreferenceChange(PhotosHeightPreferenceKey.self) { height in
                PhotosRowHeight = height}
    }
}



    
//    var body: some View {
//
//
//            GeometryReader { geomentry in
//                ScrollView(.vertical) {
//                    LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
//                ForEach(viewModelPhotos.photos.indices, id: \.self) { photoIndex in
//                    NavigationLink {
//                        ExtendedPhotoView(photosViewModel: viewModelPhotos, photoIndex: photoIndex)
//                    } label: {
//                            PhotoFriendsCell(viewModelPhotos: viewModelPhotos, photoIndex: photoIndex)
//                    }
//                }
//            } .onAppear {
//                viewModelPhotos.fetchPhotos(ownerID: id)
//            }
//            .frame(height: geomentry.size.width/2)
//            }
//
//            }
//
//
//
//    }




