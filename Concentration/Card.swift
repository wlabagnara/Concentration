//
//  Card.swift
//  Concentration
//
//  Created by William Labagnara on 1/30/19.
//  Copyright © 2019 William Labagnara. All rights reserved.
//

import Foundation

// a card object
struct Card
{
    // utility property and method to help the card
    // produce its own unique ID
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int
    {
        identifierFactory += 1
        return identifierFactory
    }
    
    // Card properties
    var identifier : Int  // unique card identifier
    var isFaceUp  = false // determines whether card is face up or down
    var isMatched = false // determines if card has been matched with another card
    
    // initializer to make sure each card is initialized with a
    // unique ID
    init()
    {
        self.identifier = Card.getUniqueIdentifier()
    }
}
