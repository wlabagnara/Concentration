//
//  Concentration.swift
//  Concentration - A program to play the game Concentration
//
//  Created by William Labagnara on 1/30/19.
//  Copyright © 2019 William Labagnara. All rights reserved.
//

import Foundation

struct Concentration
{
    var cards = [Card]() // array of cards for game

    // very important to track when one card is already face up
    // use an optional -- will be 'set' to the index of the one and only
    //  face up card; otherwise, it is not set (will be nil)
    private var indexOfOneAndOnlyFaceUpCard : Int?
    {
        get
        {
            // check (filter) all cards for face up and if only one is
            //  face up, then return its index else return nil
            return cards.indices.filter{ cards[$0].isFaceUp }.oneAndOnly
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
    mutating func chooseCard(at index: Int)
    {
        // ignore a card that already has been matched
        if !cards[index].isMatched
        {
            // there are three possibilities
            //  1. No cards are face up   --> case 1 or 2: just set indexOfOneAndOnlyFaceUpCard
            //  2. Two cards are face up
            //  3. One card is face up    --> check for match with card that was just selected (but still face down)
            
            // matchIndex will be set to the one and only face up card index or it will be nil
            //  also making sure that matchIndex is not the same index of the card you chose (i.e. if there
            //  is one and only one face up card, and you chose that card, it will ignore that. You have
            //  to choose a different card.)
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index
            {
                // check if cards match
                if cards[matchIndex] == cards[index]
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

// extension of collection that will provide the one and only element in a collection
extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil // count and first are from collection
    }
}
