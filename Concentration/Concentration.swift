//
//  Concentration.swift
//  Concentration
//
//  Created by Dario Nikšić on 21/05/2018.
//  Copyright © 2018 Dario Nikšić. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyOneFlipedCard: Int?
    
    func chooseCard(index: Int)
    {
        if cards[index].isMatched == false{
            if indexOfOneAndOnlyOneFlipedCard != nil, indexOfOneAndOnlyOneFlipedCard != index
            {
                if cards[index].identifier == cards[indexOfOneAndOnlyOneFlipedCard!].identifier
                {
                    cards[index].isMatched = true
                    cards[indexOfOneAndOnlyOneFlipedCard!].isMatched = true
                }
                indexOfOneAndOnlyOneFlipedCard = nil
                cards[index].isFaceUp = true
            }
            else{
                for flipIndex in cards.indices
                {
                    cards[flipIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFlipedCard = index
            }
        }
        
    }
    
    init(numberOfPairOfCards: Int) {
        for _ in 1...numberOfPairOfCards
        {
            let card = Card()
            var tempArray = cards
            cards.removeAll()
            tempArray += [card, card]
            let fullCount = tempArray.count
            for _ in 1...fullCount
            {
                let randomIndex = Int(arc4random_uniform(UInt32(tempArray.count)))
                cards.append(tempArray.remove(at: randomIndex))
            }
        }
    }
    
}
