//
//  FriendsCell.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 04.03.2022.
//

import SwiftUI

struct FriendsCell: View {
    
    @State var animationAmount = false
    var index: Int
    var searchResult: [UserObject]
    
    var body: some View {
        VStack {
            HStack {
                AvatarImage {
                    AsyncImage(url: URL(string: searchResult[index].avatar))
                    
                }
                .onTapGesture {
                    animationAmount = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        animationAmount = false
                    }
                }
                
                TextBuilder {
                    Text("\(searchResult[index].firstName) \(searchResult[index].lastName)")
                }
            }
        }.scaleEffect(animationAmount ? 1.2 : 1)
            .animation(.spring(response: 0.4, dampingFraction: 0.6))
        
    }
}


