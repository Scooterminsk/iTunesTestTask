//
//  UserDefaultsManager.swift
//  iTunes_TestTask
//
//  Created by Zenya Kirilov on 11.10.22.
//

import Foundation

class DataBase {
    
    static let shared = DataBase()
    
    enum SettingKeys: String {
        case user
    }
    
    let defaults = UserDefaults.standard
    let userKey = SettingKeys.user.rawValue
    
    var users: [User] {
        get {
            if let data = defaults.object(forKey: userKey) as? Data {
                return try! PropertyListDecoder().decode([User].self, from: data)
            }
            return [User]()
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: userKey)
            }
        }
    }
    
    func saveUser(firstName: String, secondName: String, phone: String, email: String, password: String, age: Date) {
        let user = User(firstName: firstName, secondName: secondName, phone: phone, email: email, password: password, age: age)
        users.insert(user, at: 0)
    }
}
