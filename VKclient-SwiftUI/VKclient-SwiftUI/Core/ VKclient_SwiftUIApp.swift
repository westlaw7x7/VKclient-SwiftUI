//
//   VKclient_SwiftUIApp.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 13.02.2022.
//

import SwiftUI

@main
struct vkApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @State var isLogin: Bool = false

    var body: some Scene {
        WindowGroup {
            if isLogin {
                TabBarCoordinatorView()
            } else {
                LoginFromWebView(isLogin: $isLogin)
            }
        }
    }
}
