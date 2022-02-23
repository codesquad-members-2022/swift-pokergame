//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    
    func showCardImages() {
        let cardOffset = 5.0
        let cardWidth = (view.frame.width - (cardOffset * 8)) / 7
        let cardHeight = cardWidth * 1.27
        var xPosition = 5.0
        let yPosition = 60.0
        
        var cardImages: [UIImageView] = (0..<7).map { _ in UIImageView(image: getImage(name: "card-back")) }
        for i in 0..<7 {
            cardImages[i].frame = CGRect(x: xPosition , y: yPosition, width: cardWidth, height: cardHeight)
            cardImages[i].contentMode = .scaleAspectFit
            cardImages.append(cardImages[i])
            view.addSubview(cardImages[i])
            xPosition += (cardWidth + cardOffset)
        }
    }
    
    
    func getImage(name: String) -> UIImage? {
        return UIImage(named: name)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let backgroundPattern = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backgroundPattern)
        }
        
        showCardImages()
        
        let card1 = Card(shape: Card.Shape.diamond, number: Card.Number.eight)
        let card2 = Card(shape: Card.Shape.heart, number: Card.Number.five)
        
        
        var cardDeck = CardDeck()
        cardDeck.shuffle()
        
        var removedCard = cardDeck.removeOne()
        
    }
}
