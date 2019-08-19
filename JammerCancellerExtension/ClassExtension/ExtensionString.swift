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
    
    private static let alphaNum: AlphaNumeric = AlphaNumeric()
    static func randomAlphaNumericString(length : Int) -> String {
        var randomString = ""
        for _ in 1..<length {
            let randomIndex = Int.random(range: 0..<alphaNum.count())
            randomString += alphaNum.get(randomIndex)
        }
        return randomString
    }

    private struct AlphaNumeric {
        private var characters:Array<String>
        init() {
            characters = Array(48...57).map {String(UnicodeScalar($0))}
            characters.append(contentsOf: (Array(65...90).map {String(UnicodeScalar($0))}))
            characters.append(contentsOf: (Array(97...122).map {String(UnicodeScalar($0))}))
        }
        func get(_ index: Int) -> String {
            return characters[index]
        }
        func count() -> Int {
            return characters.count
        }
    }
}
