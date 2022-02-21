//
//  PokerBoardViewController.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation
import UIKit

class PokerBoardViewController: UIViewController {
    
    let cardContainerView = UIView()
    var cards: [UIImageView] = (0..<7).map{ _ in  UIImageView()}
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    private func attribute() {
        if let backImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backImage)
        }
        
        cards.forEach {
            $0.image = UIImage(named: "card-back")
        }
    }
    
    private func layout() {
        self.view.addSubview(cardContainerView)
        
        cards.forEach {
            cardContainerView.addSubview($0)
        }
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        cardContainerView.translatesAutoresizingMaskIntoConstraints = false
        cardContainerView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5).isActive = true
        cardContainerView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 5).isActive = true
        cardContainerView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -5).isActive = true
        cardContainerView.heightAnchor.constraint(equalTo: cards[0].heightAnchor).isActive = true
        
        self.view.layoutIfNeeded()
        
        let cardOffset = 3.0
        let cardWidth = (cardContainerView.frame.width - (cardOffset * 6)) / 7
        let cardHeight = cardWidth * 1.27
        
        cards.enumerated().forEach { index, view in
            view.translatesAutoresizingMaskIntoConstraints = false
            if index == 0 {
                view.leftAnchor.constraint(equalTo: cardContainerView.leftAnchor).isActive = true
            } else {
                view.leftAnchor.constraint(equalTo: cards[index - 1].rightAnchor, constant: cardOffset).isActive = true
            }
            view.widthAnchor.constraint(equalToConstant: cardWidth).isActive = true
            view.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
        }
    }
}
