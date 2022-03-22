//
//  ButtonStyle.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 21.03.2022.
//

import SwiftUI

struct GrowingBLueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.blue)
            .background(Color.blue)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
