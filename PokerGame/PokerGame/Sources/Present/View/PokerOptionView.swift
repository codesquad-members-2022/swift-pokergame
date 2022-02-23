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
    var playerButtons = (2...PokerPlayers.Constants.limitCount).map { _ in UIButton()}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        
        let defaultTypeIndex = PokerGame.Constants.defaultType == .sevenCard ? 0 : 1
        typeButtons[defaultTypeIndex].isEnabled = false
        //TODO: - 상수에 연산을 하는 과정을 생략하도록 해보자
        playerButtons[PokerPlayers.Constants.defaultCount - 2].isEnabled = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(pokerGame: PokerGame) {
        typeButtons.enumerated().forEach { index, button in
            let action = UIAction(handler: { sender in
                self.switchToggleButton(buttons: self.typeButtons, at: index)
                pokerGame.action.inputPokerType(index == 0 ?.sevenCard : .fiveCard)
            })
            button.addAction(action, for: .touchUpInside)
        }
        
        playerButtons.enumerated().forEach { index, button in
            let action = UIAction(handler: { sender in
                self.switchToggleButton(buttons: self.playerButtons, at: index)
                pokerGame.action.inputPlayerCount(index)
            })
            button.addAction(action, for: .touchUpInside)
        }
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
            $1.setTitle("\(pokerType.cardCount) Cards", for: .normal)
            $1.titleLabel?.font = .systemFont(ofSize: 15)
        }
        
        playerView.distribution = .fillEqually
        playerView.clipsToBounds = true
        playerView.layer.cornerRadius = 8
        playerView.layer.borderWidth = 1.5
        playerView.layer.borderColor = UIColor.white.cgColor
        
        playerButtons.enumerated().forEach {
            $1.setBackgroundImage(UIImage(named: "buttonBg"), for: .disabled)
            $1.setTitleColor(.black, for: .disabled)
            $1.setTitleColor(.white, for: .normal )
            $1.layer.borderWidth = 0.5
            $1.layer.borderColor = UIColor.white.cgColor
            $1.setTitle("\($0 + 2)명", for: .normal)
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
        playerButtons.forEach {
            playerView.addArrangedSubview($0)
        }
    }
    
    private func switchToggleButton(buttons: [UIButton], at index: Int) {
        (0..<buttons.count).forEach {
            buttons[$0].isEnabled = index != $0
        }
    }
}
