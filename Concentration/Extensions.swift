//
//  Extensions.swift
//  Concentration
//
//  Created by Dario Nikšić on 22/05/2018.
//  Copyright © 2018 Dario Nikšić. All rights reserved.
//

import Foundation

extension Int {
    var randomNumberWithRange: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else {
            return 0
        }

    }
}
