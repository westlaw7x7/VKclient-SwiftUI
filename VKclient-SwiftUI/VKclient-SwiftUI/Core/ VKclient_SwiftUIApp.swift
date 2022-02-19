//
//   VKclient_SwiftUIApp.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 13.02.2022.
//

import SwiftUI

@main
struct VKclient_SwiftUIApp: App {
    
    @State var isLogin: Bool = false
    
    
    var body: some Scene {
        WindowGroup {
            if isLogin {
            TabViewVK()
            } else {
              LoginFromWebView(isLogin: $isLogin)
//               LoginContentView(isLogin: $isLogin)
            }
      
        }
    }
    
}
