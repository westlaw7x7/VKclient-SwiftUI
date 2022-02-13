//
//  FriendsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI

struct FriendsView: View {
   
    var someArray = ["Adam",
    "Stu",
    "Variann",
    "Garrosh"]
    
    @State var groupedArray: [String: [User]] = [:]
    var body: some View {
        List() {
            ForEach(groupedArray.keys.sorted(), id: \.self) {key in
                Section(header: Text(key)) {
                    ForEach(groupedArray[key]!, id: \.self) {value in
                        HStack{
                            AvatarImage {
                                Image(uiImage: value.image)
                            }
                            TextBuilder {
                                Text("\(value.name) \(value.surName)")
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            groupedArray = Dictionary(
                grouping: users,
                by: {$0.surName.first?.uppercased() ?? ""}
            ).mapValues{$0.sorted(by:{ $0.surName < $1.surName })}
        }
    }
}


struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
