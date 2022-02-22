//
//  PokerBoardViewController.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation
import UIKit

class PokerBoardViewController: UIViewController {
        
    let pokerOptionView = PokerOptionView()
    let playerCardViews = [PlayerCardView(), PlayerCardView(),
                           PlayerCardView(), PlayerCardView()]
    let dealerCardView = PlayerCardView()
    
    let pokerGame = PokerGame()
    
    //MARK: - Override
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        attribute()
        layout()
        
        pokerGame.delegate = self
        
        let defaultTypeIndex = Environment.Poker.defaultType == .sevenCard ? 0 : 1
        pokerOptionView.typeButtons[defaultTypeIndex].isEnabled = false
        let defaultPlayerCountIndex = Environment.Player.defaultCount - 2
        pokerOptionView.playerButtons[defaultPlayerCountIndex].isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        pokerGame.start()
    }
    
    //MARK: - Method
    
    private func bind() {
        pokerOptionView.typeButtons.enumerated().forEach { index, button in
            button.addAction(UIAction(handler: { sender in
                (0..<self.pokerOptionView.typeButtons.count).forEach {
                    self.pokerOptionView.typeButtons[$0].isEnabled = index != $0
                }
                self.pokerGame.inputPokerType(pokerType: index == 0 ?.sevenCard : .fiveCard)
            }), for: .touchUpInside)
        }
        
        pokerOptionView.playerButtons.enumerated().forEach { index, button in
            button.addAction(UIAction(handler: { sender in
                (0..<self.pokerOptionView.playerButtons.count).forEach {
                    self.pokerOptionView.playerButtons[$0].isEnabled = index != $0
                }
                self.pokerGame.inputPlayerCount(playerCount: index + 2)
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
        let leftOffset = 15.0
        let bottomOffset = self.view.frame.height - safeAreaFrame.height - safeAreaFrame.minY + 20
        let cardSpacing = 3.0
        let cardSizeRatio = 1.27
        let maxCardCount = 7
        
        //포커 옵션 레이아웃
        let optionViewWidth = 150.0
        let optionViewHeight = 80.0
        let pokerOptionPositionX = (safeAreaFrame.width / 2) - (optionViewWidth / 2)
        let pokerOptionPositionY = topOffset
        self.view.addSubview(pokerOptionView)
        pokerOptionView.frame = CGRect(x: pokerOptionPositionX, y: pokerOptionPositionY, width: optionViewWidth, height: optionViewHeight)
        
        //플레이어 카드뷰 레이아웃
        let optionViewOffset = 50.0
        let cardViewsSpacing = 50.0
        let cardWidth = safeAreaFrame.width / CGFloat(maxCardCount + 1)
        let cardTotalSpacing = CGFloat(maxCardCount - 1) * cardSpacing
        let cardCount = CGFloat(self.pokerGame.pokerType.cardCount)
        let playerCardViewWidth = cardWidth * cardCount - cardTotalSpacing
        let playerCardViewHeight = cardWidth * cardSizeRatio
        
        playerCardViews.enumerated().forEach {
            self.view.addSubview($1)
            let yOffset = topOffset + optionViewHeight + optionViewOffset
            let xPosition = leftOffset
            let yPosition = CGFloat($0) * (playerCardViewHeight + cardViewsSpacing) + yOffset
            $1.frame = CGRect(x: xPosition, y: yPosition, width: playerCardViewWidth, height: playerCardViewHeight)
        }
        
        //딜러 카드뷰 레이아웃
        self.view.addSubview(dealerCardView)
        let yPosition = self.view.frame.height - playerCardViewHeight - bottomOffset
        dealerCardView.frame = CGRect(x: leftOffset, y: yPosition, width: playerCardViewWidth, height: playerCardViewHeight)
    }
}

extension PokerBoardViewController: PokerGameDelegate {
    func startPoker() {
        playerCardViews.forEach {
            $0.isHidden = true
        }
        layout()
    }
    
    func player(index: Int, player: Player) {
        let playerView = playerCardViews[index]
        playerView.setCardImage(player: player)
    }
    
    func dealer(dealer: Player) {
        dealerCardView.setCardImage(player: dealer)
    }
}
