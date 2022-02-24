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
    let typeButtons = PokerGame.Stud.allCases.map { _ in UIButton() }
    
    let playerView = UIStackView()
    var playerButtons = (0..<PokerPlayers.Count.max.index).map { _ in UIButton() }
    
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
        
        typeButtons[PokerGame.Constants.defaultPokerStud.index].isEnabled = false
        playerButtons[PokerPlayers.Constants.defaultCount.index].isEnabled = false
    }
    
    func bind(pokerGame: PokerGame) {
        typeButtons.enumerated().forEach { index, button in
            let action = UIAction(handler: { sender in
                self.switchToggleButton(buttons: self.typeButtons, at: index)
                pokerGame.action.inputPokerStud(PokerGame.Stud.allCases[index])
            })
            button.addAction(action, for: .touchUpInside)
        }
        
        playerButtons.enumerated().forEach { index, button in
            let action = UIAction(handler: { sender in
                self.switchToggleButton(buttons: self.playerButtons, at: index)
                pokerGame.action.inputPlayerCount(PokerPlayers.Count.allCases[index])
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
            let stud = PokerGame.Stud.allCases[$0]
            $1.setTitle("\(stud.cardCount) Cards", for: .normal)
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
            $1.setTitle("\($0 + 1)명", for: .normal)
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
