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
        static let maxCardCount = 7
        static let leftOffset = 15.0
        static let bottomOffset = 50.0
        static let cardSpacing = 3.0
        static let cardViewsSpacing = 50.0
        static let cardSizeRatio = 1.27
        
        static let defaultPokerType = PokerGame.PokerType.sevenCard
        static let defaultPlayerCount = 4
    }
    
    let pokerOptionView = PokerOptionView()
    let playerCardViews = [PlayerCardView(), PlayerCardView(),
                           PlayerCardView(), PlayerCardView()]
    let dealerCardView = PlayerCardView()
    
    let pokerGame = PokerGame()
    var pokerType = Constants.defaultPokerType
    var playerCount = Constants.defaultPlayerCount
    
    //MARK: - Override
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        
        pokerOptionView.pokerTypeButtons[Constants.defaultPokerType == .sevenCard ? 0 : 1].isSelected = true
        pokerOptionView.pokerPlayerButtons[Constants.defaultPlayerCount - 2].isSelected = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        attribute()
        layout()
        
        startPoker()
    }
    
    //MARK: - Method
    
    private func bind() {
        pokerOptionView.pokerTypeButtons.enumerated().forEach { index, button in
            button.addAction(UIAction(handler: { sender in
                let pokerType: PokerGame.PokerType = index == 0 ?.sevenCard : .fiveCard
                self.onPokerTypeButtonTapped(index: index, pokerType: pokerType)
            }), for: .touchUpInside)
        }
        
        pokerOptionView.pokerPlayerButtons.enumerated().forEach { index, button in
            button.addAction(UIAction(handler: { sender in
                self.onPlayerCountButtonTapped(index: index, playerCount: index + 2)
            }), for: .touchUpInside)
        }
    }
    
    private func attribute() {
        if let backImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backImage)
        }
        
        playerCardViews.forEach {
            $0.isHidden = true
        }
    }
    
    private func layout() {
        let safeAreaFrame = self.view.safeAreaLayoutGuide.layoutFrame
        let topOffset = safeAreaFrame.minY
        
        let optionViewWidth = 150.0
        let optionViewHeight = 80.0
        let pokerOptionPositionX = (safeAreaFrame.width / 2) - (optionViewWidth / 2)
        self.view.addSubview(pokerOptionView)
        pokerOptionView.frame = CGRect(x: pokerOptionPositionX, y: topOffset, width: optionViewWidth, height: optionViewHeight)
        
        let cardWidth = safeAreaFrame.width / CGFloat(Constants.maxCardCount + 1)
        let cardHeight = cardWidth * Constants.cardSizeRatio
        let cardSpacingCount = CGFloat(Constants.maxCardCount - 1)
        let playerCardViewWidth = cardWidth * CGFloat(pokerType.rawValue) - (cardSpacingCount * Constants.cardSpacing)
        
        playerCardViews.enumerated().forEach {
            self.view.addSubview($1)
            let yOffset = (topOffset * 2) + optionViewHeight
            let yPosition = CGFloat($0) * (cardHeight + Constants.cardViewsSpacing) + yOffset
            $1.frame = CGRect(x: Constants.leftOffset, y: yPosition, width: playerCardViewWidth, height: cardHeight)
        }
        
        self.view.addSubview(dealerCardView)
        let yPosition = safeAreaFrame.height - cardHeight - Constants.bottomOffset
        dealerCardView.frame = CGRect(x: Constants.leftOffset, y: yPosition, width: playerCardViewWidth, height: cardHeight)
    }
    
    private func startPoker() {
        playerCardViews.forEach {
            $0.isHidden = true
        }
        layout()
        pokerGame.delegate = self
        pokerGame.start(pokerType: pokerType, playerCount: playerCount)
    }
    
    //MARK: - Events
    
    private func onPokerTypeButtonTapped(index: Int, pokerType: PokerGame.PokerType) {
        if self.pokerType == pokerType {
            return
        }
        
        (0..<pokerOptionView.pokerTypeButtons.count).forEach {
            pokerOptionView.pokerTypeButtons[$0].isSelected = index == $0
        }
        
        self.pokerType = pokerType
        startPoker()
    }
    
    private func onPlayerCountButtonTapped(index: Int, playerCount: Int) {
        if self.playerCount == playerCount {
            return
        }
        
        (0..<pokerOptionView.pokerPlayerButtons.count).forEach {
            pokerOptionView.pokerPlayerButtons[$0].isSelected = index == $0
        }
        
        self.playerCount = playerCount
        startPoker()
    }
}

extension PokerBoardViewController: PokerGameDelegate {
    func emptyCardDeck() {
        
    }
    
    func player(index: Int, player: Player) {
        let playerView = playerCardViews[index]
        playerView.setCardImage(player: player)
    }
    
    func dealer(dealer: Player) {
        dealerCardView.setCardImage(player: dealer)
    }
}
