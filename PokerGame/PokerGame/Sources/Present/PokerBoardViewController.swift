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
        static let topOffset = 100.0
        static let leftOffset = 15.0
        static let bottomOffset = 50.0
        static let cardSpacing = 3.0
        static let cardViewsSpacing = 50.0
        static let cardSizeRatio = 1.27
    }
    
    let playerCardViews = [PlayerCardView(), PlayerCardView(),
                           PlayerCardView(), PlayerCardView()]
    let dealerCardView = PlayerCardView()
    
    let pokerGame = PokerGame()
    let pokerType = PokerType.sevenCard
    let playerCount = 3
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        
        pokerGame.delegate = self
        pokerGame.startGame(pokerType: pokerType, playerCount: playerCount)
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
        let safeArea = self.view.safeAreaLayoutGuide
        let cardWidth = safeArea.layoutFrame.width / CGFloat(Constants.maxCardCount + 1)
        let cardHeight = cardWidth * Constants.cardSizeRatio
        let cardSpacingCount = CGFloat(Constants.maxCardCount - 1)
        let playerCardViewWidth = cardWidth * CGFloat(pokerType.rawValue) - (cardSpacingCount * Constants.cardSpacing)
        
        playerCardViews.enumerated().forEach {
            self.view.addSubview($1)
            let yPosition = CGFloat($0) * (cardHeight + Constants.cardViewsSpacing) + Constants.topOffset
            $1.frame = CGRect(x: Constants.leftOffset, y: yPosition, width: playerCardViewWidth, height: cardHeight)
        }
        
        self.view.addSubview(dealerCardView)
        let yPosition = safeArea.layoutFrame.height - cardHeight - Constants.bottomOffset
        dealerCardView.frame = CGRect(x: Constants.leftOffset, y: yPosition, width: playerCardViewWidth, height: cardHeight)
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
