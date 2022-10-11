//
//  UserModel.swift
//  iTunes_TestTask
//
//  Created by Zenya Kirilov on 11.10.22.
//

import Foundation

struct User: Codable {
    let firstName: String
    let secondName: String
    let phone: String
    let email: String
    let password: String
    let age: Date    
}
