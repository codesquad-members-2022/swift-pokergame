//
//  ViewController.swift
//  PokerGame
//
//  Created by Kai Kim on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cards: [UIImageView]!
    let background = UIImage(named:"bg_pattern.png") ?? UIImage()
    let cardImage = UIImage(named: "card-back.png") ?? UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:background)
        for card in cards {
            card.image = cardImage
        }
        
        
    }
        
}

