//
//  ViewController.swift
//  Concentration
//
//  Created by William Labagnara on 1/26/19.
//  Copyright © 2019 William Labagnara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender)
        {
            //print(" Index of touched card is \(cardNumber)" )
            game.chooseCard(at: cardNumber) // Model will process card and
            updateViewFromModel();          //  is used to handle the game updates
            flipCount += 1 // update flip count label
        }
        else
        {
            //print(" Cannot find card index of touched card!" )
        }
    }

    var emojiChoices = ["👻","🎃","👻","🎃","😎","😎"]
    
    func updateViewFromModel()
    {
        // review all the card buttons for updates and face up postion
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card   = game.cards[index]
            
            if card.isFaceUp
            {
                button.setTitle( emoji(for : card) , for: UIControl.State.normal )
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else
            {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    
    var flipCount = 0
    {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // Big 'Green Arrow' to the Model
    // initialize game for number of card pairs displayed
    //  round-up just in case there's an odd number of cards in view
    // note: make it lazy to avoid catch22 between property initializers
    //       restriction is will not be able to use propery observer
    lazy var game = Concentration(numPairOfCards: (cardButtons.count + 1) / 2)
    
    func emoji (for card: Card) -> String
    {
        return "?"
    }
}

