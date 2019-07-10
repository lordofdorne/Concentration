//
//  MOdel.swift
//  ConcentrationGame
//
//  Created by Asim on 5/28/19.
//  Copyright © 2019 Asim Samuel. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOnlyFaceUpCard: Int?
    
    func flipDownAllCards() {
        for flipDownIndex in cards.indices {
            cards[flipDownIndex].isFaceUp = false
            
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched =  true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOnlyFaceUpCard = nil
            
            } else if cards[index].isFaceUp {
                flipDownAllCards()
            }
              else  {
                // either no cards or 2 cards are face up
                flipDownAllCards()
                cards[index].isFaceUp = true
                indexOfOnlyFaceUpCard = index
            }
            
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
         //TODO: Shuffle Cards
        cards.shuffle()
    }
    
    func resetCards() {
        cards.removeAll()
        
    
        
    }
    
    

}
