//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Asim on 5/28/19.
//  Copyright © 2019 Asim Samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
   var flipCount = 0 {
    didSet{
       flipCountLabel.text = "Flips: \(flipCount)"
        
        }
    }
            
    @IBAction func restartGame(_ sender: Any) {
        game.resetCards()
        game = Concentration(numberOfPairsOfCards: cardButtons.count)
        emoji.removeAll()
        updateViewFromModel()
        
        
        }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
           game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print ("chosen card was not in cardButtons")
            }
        
        }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
        let  button = cardButtons[index]
        let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["👻", "🎃", "💀", "🕷", "👹", "🕸", "🙀", "😱", "☠️"]
    var themeTwo = ["🐧", "🐞", "🦑", "🦖", "🦂", "🦋", "🐙", "🦄", "🐳"]
    var themeThree = ["🍎", "🍕", "🥦", "🌽", "🍔", "🥝", "🥨", "🌮", "🍟"]
    var themefour = ["🚗", "✈️", "🛴", "🚓", "🚒", "🚀", "⛵️", "🚁", "🚂"]
    
   
    

    
var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier]  == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count - 1)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
     
        return emoji[card.identifier] ?? "?"
    
    }
    
    
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
}
