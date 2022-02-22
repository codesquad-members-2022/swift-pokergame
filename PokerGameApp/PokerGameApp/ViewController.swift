//
//  ViewController.swift
//  PokerGame
//
//  Created by Kai Kim on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    var cards : [UIImageView] = []
    let background = UIImage(named:"bg_pattern.png") ?? UIImage()
    let backDesign = UIImage(named: "card-back.png") ?? UIImage()
    let cardss = UIImageView()
    let spaceBetweenCards :CGFloat = 8
    let screenSize: CGRect = UIScreen.main.bounds
    let topsafeArea: CGFloat = 47
    var cardWidth : CGFloat {
        (screenSize.width - (spaceBetweenCards * CGFloat(cards.count) - 1))/CGFloat(cards.count)
    }
    var cardHeight : CGFloat {
        cardWidth * 1.27
    }
    let startOffsetX:CGFloat = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage:background)
        makeCards(num: 7)
        drawCards(cards)
    }
    
    
    func makeCards(num : Int) {
        for _ in 0..<num {
            cards.append(UIImageView(image:backDesign))
        }
    }
    
    func drawCards(_ cards:[UIImageView]) {
        
        for (index,card) in cards.enumerated() {
            card.frame = CGRect(x: startOffsetX + CGFloat(index) * (cardWidth + spaceBetweenCards), y: topsafeArea, width: cardWidth, height: cardHeight)
            view.addSubview(card)
        }
    }
    
        
}

