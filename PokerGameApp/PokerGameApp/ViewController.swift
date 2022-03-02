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
        
//        let participantCount = [2, 3, 4, 5]
//
//        for participant in participantCount {
//            var pok = PokerGame()
//            pok.playersCount = participant - 1
//
//            let availableTurnCount = (52 / pok.cardStud) / participant // 총 가능한 턴 수
//            let expectedRemainCardCount = 52 - (pok.cardStud * participant * availableTurnCount)
//            let remainCardCount = pok.run()
//
//        }
        var pok = PokerGame()
        pok.playersCount = 2
        
        let availableTurnCount = (52 / pok.cardStud) / 3 // 총 가능한 턴 수
        let expectedRemainCardCount = 52 - (pok.cardStud * 3 * availableTurnCount)
        let remainCardCount = pok.run()
        print(remainCardCount)
    }
}
