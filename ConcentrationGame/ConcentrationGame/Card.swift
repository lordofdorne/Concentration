//
//  Card.swift
//  ConcentrationGame
//
//  Created by Asim on 5/28/19.
//  Copyright © 2019 Asim Samuel. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
   
}
