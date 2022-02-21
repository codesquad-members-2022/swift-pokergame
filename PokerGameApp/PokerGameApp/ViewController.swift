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
    var safeArea : UIEdgeInsets!
    var cardWidth : CGFloat {
        (screenSize.width - (spaceBetweenCards * CGFloat(cards.count) - 1))/CGFloat(cards.count)
    }
    var startOffsetX:CGFloat = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bg_pattern.png")!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        safeArea = self.view.safeAreaInsets
        for (index,card) in cards.enumerated() {
            card.image = UIImage(named: "card-back.png")
            card.frame = CGRect(x: startOffsetX + CGFloat(index) * (cardWidth + spaceBetweenCards), y: safeArea.top, width: cardWidth, height: cardWidth * 1.26)
        }
    }
        
}

