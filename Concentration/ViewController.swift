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
    
    var emojiChoices = ["👻","🎃","👻","🎃","😎","😎"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var flipCount = 0
    {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender)
        {
            print(" Index of touched card is \(cardNumber)" )
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        else
        {
            print(" Cannot find card index of touched card!" )
        }
    }

    
    func flipCard (withEmoji  emoji: String, on button: UIButton) {
        
        flipCount += 1
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

}

