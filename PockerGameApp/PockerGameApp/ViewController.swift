//
//  ViewController.swift
//  PockerGameApp
//
//  Created by Bumgeun Song on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundPattern()
        setupCards()
        testCardDeck()
    }
    
    func testCardDeck() {
        var deck = CardDeck()
        print("---counts---")
        print(deck.count)
        print("---initial card---")
        print(deck.cards)
        
        print("---shuffled---")
        deck.shuffle()
        print(deck.cards)
        
        print("---draw---")
        print(deck.draw())
        print(deck.count)
        print(deck.cards)
    }
    
    func setupBackgroundPattern() {
        if let patternImage = UIImage(named: "BackgroundPattern") {
            self.view.backgroundColor = UIColor(patternImage: patternImage)
        }
    }
    
    func setupCards() {
        let cardViews = (0..<7).map { _ -> UIImageView in
            guard let cardBackImage = UIImage(named: "CardBackSide") else { return UIImageView() }
            let cardView = UIImageView(image: cardBackImage)
            return cardView
        }
        
        cardViews.enumerated().forEach { (i, cardView) in
            view.addSubview(cardView)
            cardView.translatesAutoresizingMaskIntoConstraints = false
            
            let leadingAnchor = i == 0 ? view.safeAreaLayoutGuide.leadingAnchor : cardViews[i-1].trailingAnchor
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            
            cardView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
            cardView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: CGFloat(1.0/7.0)).isActive = true
            cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: CGFloat(1.27)).isActive = true
        }
    }
    
    func setupCardsWithStack() {
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        for _ in (0..<7) {
            guard let cardBackImage = UIImage(named: "CardBackSide") else { continue }
            let cardView = UIImageView(image: cardBackImage)
            cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: CGFloat(1.27)).isActive = true
            stackView.addArrangedSubview(cardView)
        }
    }
}

