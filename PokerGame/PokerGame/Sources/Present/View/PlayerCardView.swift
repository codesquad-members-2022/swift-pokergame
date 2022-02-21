//
//  PlayerCardView.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation
import UIKit

class PlayerCardView: UIStackView {
        
    var cards: [UIImageView] = (0..<7).map{ _ in  UIImageView()}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
        self.spacing = 3
        self.distribution = .fillEqually
        
        cards.forEach {
            $0.image = UIImage(named: "card-back")
        }
    }
    
    func layout() {
        cards.enumerated().forEach { index, view in
            self.addArrangedSubview(view)
        }
    }
}
