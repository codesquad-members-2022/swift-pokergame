//
//  PokerOptionView.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/22.
//

import Foundation
import UIKit

class PokerOptionView: UIView {
    
    let menuStackView = UIStackView()
    
    let typeView = UIStackView()
    let typeButtons = (0..<PokerGame.PokerType.allCases.count).map { _ in UIButton()}
    
    let playerView = UIStackView()
    var playerButtons = (2...Player.Constants.limitCount).reduce(into: [Int:UIButton]()) {
        $0[$1] = UIButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        
        let defaultTypeIndex = PokerGame.Constants.defaultType == .sevenCard ? 0 : 1
        typeButtons[defaultTypeIndex].isEnabled = false
        playerButtons[Player.Constants.defaultCount]?.isEnabled = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
        menuStackView.axis = .vertical
        menuStackView.distribution = .fillEqually
        menuStackView.spacing = 5
        
        typeView.distribution = .fillEqually
        typeView.clipsToBounds = true
        typeView.layer.cornerRadius = 8
        typeView.layer.borderWidth = 1.5
        typeView.layer.borderColor = UIColor.white.cgColor
        
        typeButtons.enumerated().forEach {
            $1.setBackgroundImage(UIImage(named: "buttonBg"), for: .disabled)
            $1.setTitleColor(.black, for: .disabled)
            $1.setTitleColor(.white, for: .normal)
            let pokerType: PokerGame.PokerType = $0 == 0 ? .sevenCard : .fiveCard
            $1.setTitle("\(pokerType.rawValue) Cards", for: .normal)
            $1.titleLabel?.font = .systemFont(ofSize: 15)
        }
        
        playerView.distribution = .fillEqually
        playerView.clipsToBounds = true
        playerView.layer.cornerRadius = 8
        playerView.layer.borderWidth = 1.5
        playerView.layer.borderColor = UIColor.white.cgColor
        
        playerButtons.forEach {
            $1.setBackgroundImage(UIImage(named: "buttonBg"), for: .disabled)
            $1.setTitleColor(.black, for: .disabled)
            $1.setTitleColor(.white, for: .normal )
            $1.layer.borderWidth = 0.5
            $1.layer.borderColor = UIColor.white.cgColor
            $1.setTitle("\($0)명", for: .normal)
            $1.titleLabel?.font = .systemFont(ofSize: 15)
        }
    }
    
    func layout() {
        self.addSubview(menuStackView)
        let menuStackViewWidth = 150.0
        let menuStackViewHeight = 80.0
        let menuStackViewPostionX = (self.frame.width / 2.0) - (menuStackViewWidth / 2)
        menuStackView.frame = CGRect(x: menuStackViewPostionX, y: 0, width: menuStackViewWidth, height: menuStackViewHeight)
        
        menuStackView.addArrangedSubview(typeView)
        typeButtons.forEach {
            typeView.addArrangedSubview($0)
        }
        
        menuStackView.addArrangedSubview(playerView)
        playerButtons.sorted(by: { $0.key < $1.key}).forEach {
            playerView.addArrangedSubview($0.value)
        }
    }
}
