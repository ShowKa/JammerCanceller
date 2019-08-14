//
//  ExtensionString.swift
//  JammerCancellerExtension
//
//  Created by 金本翔太 on 2019/02/24.
//  Copyright © 2019 金本翔太. All rights reserved.
//

import Foundation

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    static func randomAlphaNumericString(length : Int) -> String {
        var characters = Array(48...57).map {String(UnicodeScalar($0))}
        characters.append(contentsOf: (Array(65...90).map {String(UnicodeScalar($0))}))
        characters.append(contentsOf: (Array(97...122).map {String(UnicodeScalar($0))}))
        var randomString = String(length)
        
        for _ in 1..<length {
            let length = UInt32(characters.count)
            let randonIndex = Int(arc4random_uniform(length))
            randomString += characters[randonIndex]
        }
        return randomString
    }
}
