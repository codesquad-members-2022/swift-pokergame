//
//  PlayerCardView.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation
import UIKit

class PlayerCardView: UIStackView {
        
    let name = UILabel()
    let cards: [UIImageView] = (0..<7).map{ _ in  UIImageView()}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
        self.spacing = -3
        self.distribution = .fillEqually
        
        cards.forEach {
            $0.image = UIImage(named: "card-back")
        }
        
        name.text = ""
        name.font = .systemFont(ofSize: 25)
        name.textColor = .black
        name.backgroundColor = .gray
        name.clipsToBounds = true
        name.layer.cornerRadius = 5
    }
    
    func layout() {
        name.frame = CGRect(x: 0, y: -35, width: 50, height: 30)
        
        cards.enumerated().forEach { index, view in
            self.addArrangedSubview(view)
        }
        
        self.addSubview(name)
    }
    
    func setCardImage(player: Player) {
        self.isHidden = false
        name.text = " \(player.name) "
        name.sizeToFit()
        
        cards.enumerated().forEach { index, cardView in
            if index < player.cards.count {
                cardView.isHidden = false
                
                let card = player.cards[index]
                if let cardImageName = card.pattern.rawValue.first {
                    cardView.image = UIImage(named: "\(cardImageName)\(card.numberToString())")
                }
            } else {
                cardView.isHidden = true
            }
        }
    }
}
