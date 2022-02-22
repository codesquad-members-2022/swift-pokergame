//
//  ViewController.swift
//  PokerGame
//
//  Created by Kai Kim on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cards: [UIImageView]!
    let spaceBetweenCards :CGFloat = 8
    let screenSize: CGRect = UIScreen.main.bounds
    var topSafeArea : CGFloat = 47
    var cardWidth : CGFloat {
        (screenSize.width - (spaceBetweenCards * CGFloat(cards.count) - 1))/CGFloat(cards.count)
    }
    var cardHeight : CGFloat {
        cardWidth * 1.27
    }
    var startOffsetX:CGFloat = 4
    let background = UIImage(named:"bg_pattern.png")!
    let cardImage = UIImage(named: "card-back.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:background)
        for (index,card) in cards.enumerated() {
            card.image = cardImage
            card.frame = CGRect(x: startOffsetX + CGFloat(index) * (cardWidth + spaceBetweenCards), y: topSafeArea, width: cardWidth, height: cardHeight)
        }
    }
        
}

