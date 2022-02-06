//
//  ContentView.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 06.02.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var login = ""
    @State private var password = ""
    
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
                    Text("VK APP")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .padding(.vertical, 30)
                        .padding(.top, 200)
                        .font(.largeTitle)
                    
                    HStack() {
                        Text("Login")
                            .fontWeight(.medium)
                        
                        Spacer()
                        TextField("", text: $login)
                            .frame(maxWidth: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack() {
                        Text("Password")
                            .fontWeight(.medium)
                        Spacer()
                        SecureField("", text: $password)
                            .frame(maxWidth: 150)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    
                    Button("Enter") {
                        print("Hello")
                    }
                    .padding(.top, 20)
                    .disabled(login.isEmpty || password.isEmpty)
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                } .frame(maxWidth: 250)
            } . onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector (UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
