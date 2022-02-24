//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/22.
//

import UIKit

class ViewController: UIViewController {

    let backgroundPatternImgName = "bg_pattern"
    let cardBackImgName = "card-back"
    let cardNumber: CGFloat = 7
    let cardRatioOfHeightToWidth: CGFloat = 1.27
    let cardMarginFromTop: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: backgroundPatternImgName) ?? UIImage.init())
        
        let displayWidth = UIScreen.main.bounds.size.width
        let cardWidth = displayWidth / cardNumber
        let cardHeight = cardWidth * cardRatioOfHeightToWidth
        for i in 0..<7 {
            let cardBackView: UIImageView! = UIImageView(image: UIImage(named: cardBackImgName))
            cardBackView.frame = CGRect(x: CGFloat( Int(cardWidth) * i), y: cardMarginFromTop, width: cardWidth, height: cardHeight)
            self.view.addSubview(cardBackView)
        }
        
        let heartQ = Card(shape: .hearts, number: .twelve)
        let spade7 = Card(shape: .spades, number: .seven)
        print(heartQ, spade7)
    }
    
    func printCard(cards: Card...) {
        for card in cards {
            card.printInfo()
        }
    }

}

