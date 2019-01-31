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

    // process what happens when a card is chosen
    func chooseCard(at index: Int)
    {
        // for now, keep it simple and just flip the card
        cards[index].isFaceUp =  cards[index].isFaceUp ? false : true
    }
    
    // initializer
    init(numPairOfCards : Int)
    {
        // create an array of cards filled with card pairs
        for _ in 1...numPairOfCards
        {
            let card = Card()     // a unique card is created for each iteration
            cards += [card, card] // card array now has new card pair
                                  // (TODO: won't both cards in pair have same ID?!)
                                  //  i.e. - only one let (instantiation) done above, but need two?
        }
    }
}
