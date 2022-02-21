//
//  VKlogin.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 16.02.2022.
//

import SwiftUI
import WebKit

struct VKLoginWebView: UIViewRepresentable {
    
    var success: () -> Void
    
    init(completion: @escaping () -> Void) {
        success = completion
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }

    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "7965892"),
            URLQueryItem(name: "scope", value: "336918"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        return components.url.map { URLRequest(url: $0) }
    }
}

class Coordinator: NSObject, WKNavigationDelegate {
    
    let parent: VKLoginWebView
    
    init(_ parent: VKLoginWebView) {
        self.parent = parent
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard
            let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment
        else { return decisionHandler(.allow) }
        
        let parameters = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        guard let token = parameters["access_token"],
              let userIdString = parameters["user_id"],
             let _ = Int(userIdString)

        else { return decisionHandler(.allow) }
        

            if token.count > 0 && (Int(userIdString) ?? 0) > 0 {
                Auth.instance.userID = Int(userIdString) ?? 0
                Auth.instance.token = token
                parent.success()
            }
            decisionHandler(.cancel)
    }
}


