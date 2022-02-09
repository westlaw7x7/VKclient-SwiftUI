//
//  FriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        
        VStack {
            List(users) { users in
                HStack {
                    AvatarImage {
                        Image(uiImage: users.image)
                    }
                    TextBuilder {
                        Text("\(users.name) \(users.surName)")
                    }
                }
            }
        }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
