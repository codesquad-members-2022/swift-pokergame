//
//  PokerOptionView.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/22.
//

import Foundation
import UIKit

protocol PokerOptionDelegate {
    func onPokerTypeSelected(pokerType: PokerGame.PokerType)
    func onPlayerCountSelected(playerCount: Int)
}

class PokerOptionView: UIStackView {
    
    let typeView = UIStackView()
    let typeButtons = (0..<PokerGame.PokerType.allCases.count).map { _ in UIButton()}
    
    let playerView = UIStackView()
    let playerButtons = (0..<Environment.maxPlayerCount - 1).map { _ in UIButton()}
    
    var delegate: PokerOptionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bind()
        attribute()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        typeButtons.enumerated().forEach { index, button in
            button.addAction(UIAction(handler: { sender in
                (0..<self.typeButtons.count).forEach {
                    self.typeButtons[$0].isEnabled = index != $0
                }
                self.delegate?.onPokerTypeSelected(pokerType: index == 0 ?.sevenCard : .fiveCard)
            }), for: .touchUpInside)
        }
        
        playerButtons.enumerated().forEach { index, button in
            button.addAction(UIAction(handler: { sender in
                (0..<self.playerButtons.count).forEach {
                    self.playerButtons[$0].isEnabled = index != $0
                }
                self.delegate?.onPlayerCountSelected(playerCount: index + 2)
            }), for: .touchUpInside)
        }
    }
    
    private func attribute() {
        self.axis = .vertical
        self.distribution = .fillEqually
        self.spacing = 5
        
        typeView.distribution = .fillEqually
        typeView.clipsToBounds = true
        typeView.layer.cornerRadius = 8
        typeView.layer.borderWidth = 1.5
        typeView.layer.borderColor = UIColor.white.cgColor
        
        typeButtons.enumerated().forEach {
            $1.setBackgroundImage(UIColor.white.image(), for: .disabled)
            $1.setBackgroundImage(UIColor.clear.image(), for: .normal)
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
            $1.setBackgroundImage(UIColor.white.image(), for: .disabled)
            $1.setBackgroundImage(UIColor.clear.image(), for: .normal)
            $1.setTitleColor(.black, for: .disabled)
            $1.setTitleColor(.white, for: .normal )
            $1.layer.borderWidth = 0.5
            $1.layer.borderColor = UIColor.white.cgColor
            $1.setTitle("\($0+2)명", for: .normal)
            $1.titleLabel?.font = .systemFont(ofSize: 15)
        }
    }
    
    func layout() {
        typeView.frame = CGRect(origin: CGPoint(x: 100, y: 0), size: CGSize(width: 100, height: 50))
        self.addArrangedSubview(typeView)
        typeButtons.forEach {
            typeView.addArrangedSubview($0)
        }
        
        self.addArrangedSubview(playerView)
        playerButtons.forEach {
            playerView.addArrangedSubview($0)
        }
    }
}
