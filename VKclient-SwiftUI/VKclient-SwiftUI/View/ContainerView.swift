//
//  ContainerView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 13.02.2022.
//

import SwiftUI

struct ContainerView: View {
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginContentView(isUserLoggedIn: $shouldShowMainView)
                NavigationLink(destination: TabViewVK(),
                               isActive: $shouldShowMainView) {
                    EmptyView()
                } .navigationTitle("Login screen")
                    .navigationBarHidden(true)
            }
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
