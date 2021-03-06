//
//  LoginContentView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 06.02.2022.
//

import SwiftUI
import Combine

struct LoginContentView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var shouldShowLogo: Bool = true
    @Binding var isLogin: Bool
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false}
    )
        .removeDuplicates()
    
    var body: some View {
        
        ZStack() {
            GeometryReader { geometry in
                Image("wallpaper2")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            }
            
            ScrollView {
                VStack(alignment: .center) {
                    if shouldShowLogo {
                        Text("VK APP")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                            .padding(.vertical, 30)
                            .padding(.top, 20)
                            .font(.largeTitle)
                            .shadow(color: .black,
                                    radius: 4,
                                    x: -18.0,
                                    y: 15.0)
                    }
                    
                    HStack() {
                        Text("Login")
                            .fontWeight(.medium)
                            .shadow(color: .black,
                                    radius: 2.0,
                                    x: -18.0,
                                    y: 11.0)
                            .padding(.leading, 50.0)
                        Spacer()
                        TextField("", text: $login)
                            .frame(maxWidth: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .shadow(color: .black,
                                    radius: 13.0,
                                    x: -18.0,
                                    y: 15.0)
                            .padding(.trailing, 40.0)
                    }
                    HStack() {
                        Text("Password")
                            .fontWeight(.medium)
                            .shadow(color: .black,
                                    radius: 2.0,
                                    x: -18.0,
                                    y: 11.0)
                            .padding(.leading, 50.0)
                        Spacer()
                        SecureField("", text: $password)
                            .frame(maxWidth: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .shadow(color: .black,
                                    radius: 13.0,
                                    x: -18.0,
                                    y: 15.0)
                            .padding(.trailing, 40.0)
                            .padding(.leading, 10.0)
                    }
                    Button(action: verifyLoginData) {
                        Text("Enter")
                    }
                    .padding(.top, 20)
                    .disabled(login.isEmpty || password.isEmpty)
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                } .onReceive(keyboardIsOnPublisher, perform: { isKeyboardOn in
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.shouldShowLogo = !isKeyboardOn
                    }
                })
                    .frame(maxWidth: 350)
            }
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }.alert(isPresented: $showAlert, content: { Alert(title: Text("Error"), message: Text("Incorrent Login/Password was entered"))
        })
    }
    
    private func verifyLoginData() {
        if login == "A" || password == "1" {
            isLogin = true
        } else {
            showAlert = true
            password = ""
        }
    }
    
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector (UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}




