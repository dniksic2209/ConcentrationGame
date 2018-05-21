//
//  Card.swift
//  Concentration
//
//  Created by Dario Nikšić on 21/05/2018.
//  Copyright © 2018 Dario Nikšić. All rights reserved.
//

import Foundation

struct Card {
    var isMatched: Bool = false
    var isFaceUp: Bool = false
    var identifier: Int
    
    static var identifierFactory: Int = 0;
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
