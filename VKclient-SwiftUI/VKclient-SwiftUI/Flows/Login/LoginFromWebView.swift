//
//  LoginFromWebView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 17.02.2022.
//

import SwiftUI

struct LoginFromWebView: View {
    
    @Binding var isLogin: Bool
    
    var body: some View {
        VKLoginWebView {
            isLogin = true
        }
    }
}
