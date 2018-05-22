//
//  ViewController.swift
//  Concentration
//
//  Created by Dario Nikšić on 20/05/2018.
//  Copyright © 2018 Dario Nikšić. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairOfCards: cardButtons.count / 2)
    
    private var flipCount = 0
    {
        didSet{
            flipCountLabel.text = "Flip count: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender)
        {
            game.chooseCard(index: cardNumber)
            updateUIFromModel()
        }
        else{
            print("Non exesisting card selected!")
        }
    }
    
    private func updateUIFromModel(){
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp == true{
                button.setTitle(setEmoji(for: card.identifier), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiArray = ["🙄","🤢","🤠","👿","👹","🤡","💩","👻","🎃","😻","👍","💋","👣","👠","🌹"]
    private var emojiDict = [Int:String]()
    
    private func setEmoji(for identifier: Int) -> String {
        
        if !(emojiDict[identifier] != nil), emojiArray.count > 0
        {
            emojiDict[identifier] = emojiArray.remove(at: emojiArray.count.randomNumberWithRange)
        }
        return emojiDict[identifier] ?? "?"
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
}

