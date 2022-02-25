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
        test()
    }
    
    func test() {
        print("🃏카드 초기화🃏")
        var cardDeck = CardDeck()
        
        if cardDeck.count == 52 {
            print("카드 전체를 초기화했습니다.")
            print("총 \(cardDeck.count)장의 카드가 있습니다.\n")
        }
        
        print("🃏카드 섞기🃏")
        cardDeck.shuffle()
        print("전체 \(cardDeck.count)장의 카드를 섞었습니다.\n")
        
        var pokerGame = PokerGame()
        pokerGame.run()
        
        print("🃏카드 하나 뽑기🃏 > 뽑은 카드", cardDeck.removeOne()!)
        if cardDeck.count == 51 {
            print("총 \(cardDeck.count)장의 카드가 남아있습니다.\n")
        }
        
        print("🃏카드 하나 뽑기🃏 > 뽑은 카드", cardDeck.removeOne()!)
        if cardDeck.count == 50 {
            print("총 \(cardDeck.count)장의 카드가 남아있습니다.\n")
        }
        
        print("🃏카드 초기화🃏")
        cardDeck.reset()
        if cardDeck.count == 52 {
            print("카드 전체를 초기화했습니다.")
            print("총 \(cardDeck.count)장의 카드가 있습니다.\n")
        }
    }
    
}
