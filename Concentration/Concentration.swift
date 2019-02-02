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
                
                cards[index].isFaceUp       = true
                indexOfOneAndOnlyFaceUpCard = nil   // un-set optional
            }
            else
            {
                // either no cards or two cards are face up
                //  in this case turn all cards face down (doesn't matter if some are already face down)
                //  and then turn selected card face up
                for flipDownIndex in cards.indices
                {
                    cards[flipDownIndex].isFaceUp = false
                }

                cards[index].isFaceUp = true         // this is now the one and only face up card
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

        cards.shuffle() // shuffle the cards!
    }
}
