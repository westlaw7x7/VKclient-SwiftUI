//
//  FriendsCell.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 04.03.2022.
//

import SwiftUI

struct FriendsCell: View {
    
    @State var animationAmount = false
    let searchResult: UserObject
    
    var body: some View {
        VStack {
            HStack {
                AvatarImage {
                    AsyncImage(url: URL(string: searchResult.avatar))
                }
                .onTapGesture {
                    animationAmount = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        animationAmount = false
                    }
                }
                TextBuilder {
                    Text("\(searchResult.firstName) \(searchResult.lastName)")
                }
            }
        }.scaleEffect(animationAmount ? 1.2 : 1)
            .animation(.spring(response: 0.4, dampingFraction: 0.6))
    }
}


