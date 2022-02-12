//
//  ViewModifier.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 09.02.2022.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black, radius: shadowRadius)
    }
}

