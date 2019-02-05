//
//  Concentration.swift
//  Concentration
//
//  Created by William Labagnara on 1/30/19.
//  Copyright © 2019 William Labagnara. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]() // array of cards for game

    // very important to track when one card is already face up
    // use an optional -- will be 'set' to the index of the one and only face up card
    //  otherwise, it is not set (will be nil)
    var indexOfOneAndOnlyFaceUpCard : Int?
    {
        get
        {
            // check all cards for face up and if only
            //  one is face up, then return its index else
            //  return nil
            var foundIndex : Int? // optional gets free init to nil
            
            for index in cards.indices
            {
                if cards[index].isFaceUp
                {
                    if foundIndex == nil
                    {
                        foundIndex = index // found first faceUp card
                    }
                    else
                    {
                        return nil // found another face up card (therefore not one and only face up card)
                    }
                }
            }
            return foundIndex  // can be index of one and only face up card or nil if no face up cards
        }
        
        set
        {
            // turn all cards face down except for the card
            //  at newValue
            for index in cards.indices
            {
                cards[index].isFaceUp = ( index == newValue )
            }
        }
    }
    
    // process what happens when a card is chosen
    func chooseCard(at index: Int)
    {
        // ignore a card that already has been matched
        if !cards[index].isMatched
        {
            // there are three possibilities
            // 1. No cards are face up   --> just flip over chosen card
            // 2. Two cards are face up  --> flip face up cards to face down and flip chosen card
            // 3. One card is face up    --> now need to check for match
            
            // matchIndex will be set to the one and only face up card index or it will be nil
            //  also making sure that matchIndex is not the same index of the card you chose (i.e. if there
            //  is one and only one face up card, and you chose that card, it will ignore that. You have
            //  to choose a different card.)
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index
            {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched      = true
                }
                cards[index].isFaceUp = true
            }
            else
            {
                // either no cards or two cards are face up
                indexOfOneAndOnlyFaceUpCard = index  //  set optional accordingly
            }
        }
    }
    
    // initializer
    init(numPairOfCards : Int)
    {
        // create an array of cards filled with card pairs
        for _ in 1...numPairOfCards
        {
            let card = Card()     // a unique card is created for each iteration
            cards += [card, card] // card array now has new card pair
                                  // both cards in pair have same identifier
        }

        cards.shuffle() // MARK: shuffle the cards!
    }
}
