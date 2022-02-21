//
//  PokerBoardViewController.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation
import UIKit

class PokerBoardViewController: UIViewController {
    
    enum Constants {
        static let cardOffset: CGFloat = 3
    }
    
    let cardStackView = UIStackView()
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
        
        cardStackView.spacing = Constants.cardOffset
    }
    
    private func layout() {
        self.view.addSubview(cardStackView)
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        cardStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5).isActive = true
        cardStackView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 5).isActive = true
        cardStackView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -5).isActive = true
        
        self.view.layoutIfNeeded()
        
        let cardWidth = (cardStackView.frame.width - (Constants.cardOffset * 6)) / 7
        let cardHeight = cardWidth * 1.27

        cards.enumerated().forEach { index, view in
            cardStackView.addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: cardWidth).isActive = true
            view.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
        }
    }
}
