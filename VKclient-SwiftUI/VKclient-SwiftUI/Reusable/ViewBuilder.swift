//
//  ViewBuilder.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI

struct AvatarImage: View {
    var content: AsyncImage<Image>
    
    init(@ViewBuilder content: () -> AsyncImage<Image>) {
        self.content = content()
    }
    
    var body: some View {
        content
            .scaledToFill()
            .frame(width: 100,
                   height: 100,
                   alignment: .leading)
            .clipShape(Circle())
            .modifier(ShadowModifier(shadowColor: .black))
    }
}

struct GroupImage: View {
    var content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .scaledToFill()
            .frame(width: 100,
                   height: 100,
                   alignment: .leading)
            .clipShape(Rectangle())
    }
}

struct TextBuilder: View {
    var content: Text
    
    init(@ViewBuilder content: () -> Text) {
        self.content = content()
    }
    
    var body: some View {
        content
            .font(.system(size: 14, weight: .medium, design: .serif))
    }
}

