//
//  ViewController.swift
//  Concentration
//
//  Created by William Labagnara on 1/26/19.
//  Copyright © 2019 William Labagnara. All rights reserved.
//
// Reference:
//   Stanford - Developing iOS 11 Apps with Swift - 1. Introduction to iOS 11, Xcode 9 and Swift 4
//      https://youtu.be/TZL5AmwuwlA?list=PL3d_SFOiG7_8ofjyKzX6Nl1wZehbdiZC_
//

import UIKit

class ViewController: UIViewController
{
    
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
    
    // check the model to update the view accordingly
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
    
    // property to count the times a card is flipped over
    var flipCount = 0
    {
        didSet { // property observer will update label in view
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // emoji choices that may be displayed on cards
    var emojiChoices = ["🏳️","🏴","🏁","🇺🇸","🇮🇹","🇳🇱","🇱🇷","🇮🇪","🇧🇩"]
    
    var emoji = [Int : String]() // Dictionary to lookup emoji from index
    
    // lookup emoji from card ID
    func emoji (for card: Card) -> String
    {
        // just-in-time creation of dictionary entry
        //  lookup the emoji randomly, but then remove it
        //  so that it is not used again!
        if emoji[card.identifier] == nil, emojiChoices.count > 0  // if need an emoji and at least one is available
        {
            // pickup one of the available emojii randomly assign it to the dictionary
            let randomEmoji = Int( arc4random_uniform(UInt32(emojiChoices.count)) )
            emoji[card.identifier] = emojiChoices.remove(at: randomEmoji)
        }
        
        return emoji[card.identifier] ?? "X" // return emoji or X if lookup failed
    }
    
    // Controller ----> Model
    // initialize game for number of card pairs displayed
    //  round-up just in case there's an odd number of cards in view
    // note: make it lazy to avoid catch22 between property initializers
    //       restriction is that you will not be able to use propery observer
    lazy var game = Concentration(numPairOfCards: (cardButtons.count + 1) / 2)

}

