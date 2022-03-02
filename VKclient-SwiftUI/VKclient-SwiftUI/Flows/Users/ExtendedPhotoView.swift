//
//  ExtendedPhotoView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 20.02.2022.
//

import SwiftUI
import Kingfisher

struct ExtendedPhotoView: View {
    @ObservedObject var photosViewModel: PhotosViewModel
    let user: UserObject
    var photoIndex: Int
    
    var body: some View {
        GeometryReader { geometry in
            TabView {
                
//                ForEach(photosViewModel.photos) { photo in
                KFImage(URL(string: photosViewModel.photos[photoIndex].sizes["x"]!))
                        .resizable()
                        .scaledToFill()
//                        .tag
//                }
            }.tabViewStyle(PageTabViewStyle())
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
