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
        static let cardOffset: CGFloat = 3
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
        let topOffset = 100.0
        let xSpacing = 3.0
        let ySpacing = 50.0
        
        let safeArea = self.view.safeAreaLayoutGuide
        let cardWidth = safeArea.layoutFrame.width / 8.0
        let cardHeight = cardWidth * 1.27
        let playerCardViewWidth = cardWidth * CGFloat(pokerType.rawValue) - (6 * xSpacing)
        
        playerCardViews.enumerated().forEach {
            self.view.addSubview($1)
            let yPosition = CGFloat($0) * (cardHeight + ySpacing) + topOffset
            $1.frame = CGRect(x: 15, y: yPosition, width: playerCardViewWidth, height: cardHeight)
        }
        
        self.view.addSubview(dealerCardView)
        let yPosition = CGFloat(playerCardViews.count) * (cardHeight + ySpacing) + topOffset
        dealerCardView.frame = CGRect(x: 15, y: yPosition, width: playerCardViewWidth, height: cardHeight)
    }
}

extension PokerBoardViewController: PokerGameDelegate {
    func player(index: Int, player: Player) {
        let playerView = playerCardViews[index]
        playerView.setCardImage(player: player)
    }
    
    func dealer(dealer: Player) {
        dealerCardView.setCardImage(player: dealer)
    }
}
