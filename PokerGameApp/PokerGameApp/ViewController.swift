//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 허태양 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    var cards = [Card]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testDeck()
        
        setBackground()
        addCardToView()
        
        createCard()
        printCard()
    }
    
    func testDeck() {
        let deck = Deck()
        
        print("current count:", deck.count())
        print("card list:", deck.cards, "\n")
        
        print("shuffle test")
        deck.shuffle()
        print("shuffled card list:", deck.cards, "\n")
        
        print("removeOne test")
        for _ in 0..<25 {
            print("cards count:", deck.count(), terminator: ", ")
            print("removed card:", deck.removeOne(), terminator: "\t=> ")
            print("removed cards count:", deck.count())
        }
        
    }
    
    func createCard() {
        cards.append(Card(.twelve, .heart))
        cards.append(Card(.seven, .spade))
    }
    
    func printCard() {
        for card in cards {
            print(card)
        }
    }
    
    func setBackground() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern.png")!)
    }
    
    func addCardToView() {
        let screenWidth = UIScreen.main.bounds.width
        let cardWidth = screenWidth / 7
        let image = UIImage(named: "card-back.png")!
        
        for i in 0..<7 {
            let imageView = UIImageView()

            imageView.contentMode = .scaleToFill
            imageView.image = image
            imageView.frame = CGRect(x: CGFloat(i) * cardWidth, y: 35, width: cardWidth, height: cardWidth * 1.27)
            
            self.view.addSubview(imageView)
        }
    }


}

