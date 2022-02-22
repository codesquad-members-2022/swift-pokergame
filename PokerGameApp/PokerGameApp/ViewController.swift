//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 최예주 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern") ?? UIImage())
        
        configureCard(numberOfCards: 7)
        
        let sampleCard1 = Card(symbol: .heart, rank: .Q)
        let sampleCard2 = Card(symbol: .spade, rank: .seven)
        printCardInfo(card: sampleCard1)
        printCardInfo(card: sampleCard2)
                                            
    }
    
    func configureCard(numberOfCards: Int){
        
        let screenWidth = UIScreen.main.bounds.size.width
        let cardImage = UIImage(named: "card-back") ?? UIImage()
        let gap = 5.0
        
        for i in 0..<numberOfCards {
            
            let numberOfCards = CGFloat(numberOfCards)
            let cardXPosition: CGFloat =  CGFloat(CGFloat(i) * (screenWidth/numberOfCards) + gap )
            let card = UIImageView(frame: CGRect(x: cardXPosition , y: 70, width: screenWidth/numberOfCards - gap, height: (screenWidth/numberOfCards - gap) * 1.25))
            
            card.image = cardImage
            card.contentMode = .scaleAspectFit
      
            self.view.addSubview(card)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func printCardInfo(card: Card) {
        print(card)
    }


}

