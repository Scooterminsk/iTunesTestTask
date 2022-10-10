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
    }
    
    enum Regex: String {
        case name = "[a-zA-Z]{1,}"
    }
    
    func isValid(validType: ValidType) -> Bool {
        
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .name: regex = Regex.name.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
}
