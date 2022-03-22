//
//  SearchGroupViewModel.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 21.03.2022.
//

import Foundation
import SwiftUI
class SearchGroupViewModel: ObservableObject {
    
    @Published var groups: [SearchedObjects] = []
    private let networkService = NetworkService()
    private let token = Auth.instance.token
    
    public func fetchGroupsFromNetwork(searchRequest: String) {
        networkService.SearchForGroups(token: token, search: searchRequest) { [weak self] groups in
            guard let self = self else { return }
            self.groups = groups
        }
    }
}
