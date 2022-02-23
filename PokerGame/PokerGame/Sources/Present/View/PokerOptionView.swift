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
    var playerButtons = (2...PokerPlayers.Constants.limitCount).reduce(into: [Int:UIButton]()) {
        $0[$1] = UIButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        
        let defaultTypeIndex = PokerGame.Constants.defaultType == .sevenCard ? 0 : 1
        typeButtons[defaultTypeIndex].isEnabled = false
        playerButtons[PokerPlayers.Constants.defaultCount]?.isEnabled = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(pokerGame: PokerGame) {
        typeButtons.enumerated().forEach { index, button in
            button.addAction(UIAction(handler: { sender in
                (0..<self.typeButtons.count).forEach {
                    self.typeButtons[$0].isEnabled = index != $0
                }
                pokerGame.action.inputPokerType(index == 0 ?.sevenCard : .fiveCard)
            }), for: .touchUpInside)
        }
        
        playerButtons.forEach { index, button in
            button.addAction(UIAction(handler: { sender in
                self.playerButtons.forEach {
                    $1.isEnabled = index != $0
                }
                pokerGame.action.inputPlayerCount(index)
            }), for: .touchUpInside)
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
