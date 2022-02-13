//
//  GroupsView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI

struct GroupsView: View {
    var body: some View {
        
            VStack {
                
                List(groups) { group in
                    HStack {
                        AvatarImage {
                            Image(uiImage: group.image)
                        }
                        
                        TextBuilder {
                            Text(group.name)
                        }
                    }
                }
            }
        }
        
    }


struct GroupsList_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
