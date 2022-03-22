//
//  PhotoFriendsCell.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 04.03.2022.
//

import SwiftUI
import Kingfisher

struct PhotosHeightPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct PhotoFriendsCell: View {
    @Binding var isSelected: Bool
    @State var isPressed = false
    @Binding var selection: Int?
    let index: Int?
    let URL: String
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    KFImage(Foundation.URL(string: URL))
                        .resizable()
                    
                    Image(systemName: isPressed ? "suit.heart.fill" : "suit.heart")
                        .animation(.linear, value: isPressed)
                        .font(.system(size: 25))
                        .onTapGesture {
                            self.isPressed.toggle()
                        }
                        .foregroundColor(isPressed ? .red: .white)
                }
            }.preference(key: PhotosHeightPreferenceKey.self, value: proxy.size.width)
                .anchorPreference(key: PhotosAnchorPreferenceKey.self, value: .bounds) {
                    index == self.selection ? $0 : nil
                }
                .onTapGesture(count: 2, perform: {
                    if index == self.selection {
                        self.isSelected = true
                    }
                })
                .onTapGesture {
                    withAnimation(.default) {
                        self.selection = index
                    }
                }
        }
    }
}
