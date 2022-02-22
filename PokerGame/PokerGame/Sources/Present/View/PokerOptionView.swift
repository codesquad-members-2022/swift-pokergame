//
//  PokerOptionView.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/22.
//

import Foundation
import UIKit

class PokerOptionView: UIStackView {
    
    let pokerTypeView = UIStackView()
    let pokerTypeButtons = (0..<PokerGame.PokerType.allCases.count).map { _ in UIButton()}
    
    let pokerPlayerView = UIStackView()
    let pokerPlayerButtons = (0..<Environment.maxPlayer - 1).map { _ in UIButton()}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
        self.axis = .vertical
        self.distribution = .fillEqually
        self.spacing = 5
        
        pokerTypeView.distribution = .fillEqually
        pokerTypeView.clipsToBounds = true
        pokerTypeView.layer.cornerRadius = 8
        pokerTypeView.layer.borderWidth = 1.5
        pokerTypeView.layer.borderColor = UIColor.white.cgColor
        
        pokerTypeButtons.enumerated().forEach {
            $1.setBackgroundImage(UIColor.white.image(), for: .selected)
            $1.setBackgroundImage(UIColor.clear.image(), for: .normal)
            $1.setTitleColor(.black, for: .selected)
            $1.setTitleColor(.white, for: .normal )
            $1.layer.borderWidth = 0.5
            $1.layer.borderColor = UIColor.white.cgColor
            let pokerType: PokerGame.PokerType = $0 == 0 ? .sevenCard : .fiveCard
            $1.setTitle("\(pokerType.rawValue) Cards", for: .normal)
            $1.titleLabel?.font = .systemFont(ofSize: 15)
        }
        
        pokerPlayerView.distribution = .fillEqually
        pokerPlayerView.clipsToBounds = true
        pokerPlayerView.layer.cornerRadius = 8
        pokerPlayerView.layer.borderWidth = 1.5
        pokerPlayerView.layer.borderColor = UIColor.white.cgColor
        
        pokerPlayerButtons.enumerated().forEach {
            $1.setBackgroundImage(UIColor.white.image(), for: .selected)
            $1.setBackgroundImage(UIColor.clear.image(), for: .normal)
            $1.setTitleColor(.black, for: .selected)
            $1.setTitleColor(.white, for: .normal )
            $1.layer.borderWidth = 0.5
            $1.layer.borderColor = UIColor.white.cgColor
            $1.setTitle("\($0+2)명", for: .normal)
            $1.titleLabel?.font = .systemFont(ofSize: 15)
        }
//        self.spacing = -3
//        self.distribution = .fillEqually
//
//        name.font = .systemFont(ofSize: 25)
//        name.textColor = .black
//        name.backgroundColor = .gray
//        name.clipsToBounds = true
//        name.layer.cornerRadius = 5
    }
    
    func layout() {
        pokerTypeView.frame = CGRect(origin: CGPoint(x: 100, y: 0), size: CGSize(width: 100, height: 50))
        self.addArrangedSubview(pokerTypeView)
        pokerTypeButtons.forEach {
            pokerTypeView.addArrangedSubview($0)
        }
        
        self.addArrangedSubview(pokerPlayerView)
        pokerPlayerButtons.forEach {
            pokerPlayerView.addArrangedSubview($0)
        }
    }
}
