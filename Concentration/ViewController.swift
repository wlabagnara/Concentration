//
//  ViewController.swift
//  Concentration
//
//  Created by William Labagnara on 1/26/19.
//  Copyright © 2019 William Labagnara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }
    
    func flipCard (withEmoji  emoji: String, on button: UIButton) {
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

}

