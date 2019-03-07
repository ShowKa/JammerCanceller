//
//  ExtensionInt.swift
//  JammerCancellerExtension
//
//  Created by 金本翔太 on 2019/03/08.
//  Copyright © 2019 金本翔太. All rights reserved.
//

import Foundation
extension Int
{
    static func random(range: Range<Int> ) -> Int
    {
        var offset = 0
        
        if range.lowerBound < 0   // allow negative ranges
        {
            offset = abs(range.lowerBound)
        }
        
        let mini = UInt32(range.lowerBound + offset)
        let maxi = UInt32(range.upperBound   + offset)
        
        return Int(mini + arc4random_uniform(maxi - mini)) - offset
    }
}
