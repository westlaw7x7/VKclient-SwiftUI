//
//  Auth.swift
//  VKclient-SwiftUI
//
//  Created by Alexander Grigoryev on 17.02.2022.
//

import Foundation

class Auth {
    static let instance = Auth()
    var token = ""
    var userID = 0

    private init() {}
}
