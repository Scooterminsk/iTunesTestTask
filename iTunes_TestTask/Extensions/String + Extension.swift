//
//  String + Extension.swift
//  iTunes_TestTask
//
//  Created by Zenya Kirilov on 10.10.22.
//

import Foundation


extension String {
    
    enum ValidType {
        case name
        case email
    }
    
    enum Regex: String {
        case name = "[a-zA-Z]{1,}"
        case email = "[a-zA-Z0-9._]+@[a-zA-Z0-9]+\\.[a-zA-Z]{2,}"
    }
    
    func isValid(validType: ValidType) -> Bool {
        
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .name: regex = Regex.name.rawValue
        case.email: regex = Regex.email.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
}
