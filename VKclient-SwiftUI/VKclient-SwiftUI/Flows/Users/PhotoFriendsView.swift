//
//  PhotoFriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 13.02.2022.
//

import SwiftUI

struct PhotoFriendsView: View {
    
    @State private var PhotosRowHeight: CGFloat? = nil
    @State private var selection: Int? = nil
    @State private var isSelected: Bool = false
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
                        NavigationLink(isActive: $isSelected) {
                            ExtendedPhotoView(photosViewModel: viewModel, photoIndex: $selection)
                        } label: {
                            PhotoFriendsCell(isSelected: $isSelected, selection: $selection, index: index, URL: viewModel.photos[index].sizes["x"]!)
                                .frame(height: PhotosRowHeight)
                        }
                    }
                }.onAppear {viewModel.fetchPhotos(ownerID: user.id)}
                    .onPreferenceChange(PhotosHeightPreferenceKey.self) { height in
                        PhotosRowHeight = height}
                    .overlayPreferenceValue(PhotosAnchorPreferenceKey.self) { SelectionRectangle(anchor: $0) }
            }
        }
    }
}



