//
//  SelectionRectangle.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 21.03.2022.
//

import SwiftUI

struct PhotosAnchorPreferenceKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>? = nil
    
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = value ?? nextValue()
    }
}

struct SelectionRectangle: View {
    let anchor: Anchor<CGRect>?
    
    var body: some View {
        GeometryReader { proxy in
            if let rect = self.anchor.map({ proxy[$0] }) {
                Rectangle()
                    .fill(Color.clear)
                    .border(Color.blue, width: 2)
                    .offset(x: rect.minX, y: rect.minY)
                    .frame(width: rect.width, height: rect.height)
            }
        }
    }
}
