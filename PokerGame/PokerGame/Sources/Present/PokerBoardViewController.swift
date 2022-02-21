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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        
        pokerGame.delegate = self
        pokerGame.action.playGame(pokerType, 4)
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
        let cardWidth = safeArea.layoutFrame.width / 8.0
        let cardHeight = cardWidth * 1.27
        let safeAreaWidth = cardWidth * CGFloat(pokerType.rawValue) - (6 * 3)
        let topOffset = 100.0
        let yAxisOffset = 50.0
        
        playerCardViews.enumerated().forEach { index, view in
            self.view.addSubview(view)
            let yPosition = CGFloat(index) * (cardHeight + yAxisOffset) + topOffset
            view.frame = CGRect(x: 15, y: yPosition, width: safeAreaWidth, height: cardHeight)
        }
        
        self.view.addSubview(dealerCardView)
        let yPosition = CGFloat(playerCardViews.count) * (cardHeight + yAxisOffset) + topOffset
        dealerCardView.frame = CGRect(x: 15, y: yPosition, width: safeAreaWidth, height: cardHeight)
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
