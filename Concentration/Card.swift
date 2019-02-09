//
//  Card.swift
//  Concentration
//
//  Created by William Labagnara on 1/30/19.
//  Copyright © 2019 William Labagnara. All rights reserved.
//

import Foundation

// a card object
struct Card : Hashable
{
    // protocol conformance Hashable must return unique value
    internal var hashValue : Int
    {
        return identifier
    }
    
    // protocol conformance Hashable : Equatable
    static func == (lhs: Card, rhs: Card) -> Bool {
        return  lhs.identifier == rhs.identifier // cards are equal when identifiers are equal
    }
    
    // utility property and method to help the card
    // produce its own unique ID
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int
    {
        identifierFactory += 1
        return identifierFactory
    }
    
    // Card properties
    var isFaceUp  = false        // determines whether card is face up or down
    var isMatched = false        // determines if card has been matched with another card
    private var identifier : Int // unique card identifier

    // initializer to make sure each card is initialized with a unique ID
    init()
    {
        self.identifier = Card.getUniqueIdentifier()
    }
}
