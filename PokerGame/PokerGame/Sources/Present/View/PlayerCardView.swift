//
//  PlayerCardView.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation
import UIKit

class PlayerCardView: UIView {
    
    let name = UILabel()
    let cardStackView = UIStackView()
    let cards: [UIImageView] = (0..<7).map{ _ in  UIImageView()}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private func initialize() {
        attribute()
    }
    
    private func attribute() {
        cardStackView.spacing = 0
        cardStackView.axis = .horizontal
        cardStackView.distribution = .fillEqually
        
        name.font = .systemFont(ofSize: 25)
        name.textColor = .white
        
        cards.forEach {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 5
        }
    }
    
    func layout() {
        self.addSubview(name)
        name.frame = CGRect(x: 0, y: 0, width: 10, height: 30)
        
        self.addSubview(cardStackView)
        let cardWidth = (self.frame.width) / 8.0
        cardStackView.frame = CGRect(x: 0, y: 30, width: cardWidth * 7.0, height: cardWidth * 1.27)
        
        cards.enumerated().forEach { index, view in
            cardStackView.addArrangedSubview(view)
        }
    }
    
    func setCard(at index: Int, card: Card) {
        cards[index].image = UIImage(named: "\(card)")
    }
}
