//
//  PhotosViewModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 19.02.2022.
//

import Foundation

class PhotosViewModel: ObservableObject, Identifiable {
    
    let id = UUID()
    private let networkService = NetworkService()
    private let token = Auth.instance.token
    @Published var photos: [PhotosObject] = []
    
   public func fetchPhotos(ownerID: Int) {
         networkService.loadPhotos(token: token, ownerID: ownerID ) { [weak self] photos in
            guard let self = self else { return }
            self.photos = photos
        }
    }
}
