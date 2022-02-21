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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        
        pokerGame.delegate = self
        pokerGame.action.playGame(.sevenCard, 4)
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
        let safeAreaWidth = safeArea.layoutFrame.width - 80
        let cardWidth = safeAreaWidth / 7
        let cardHeight = cardWidth * 1.27
        let yAxisOffset = 20.0
        
        playerCardViews.enumerated().forEach { index, view in
            self.view.addSubview(view)
            let yPosition = CGFloat(index) * (cardHeight + yAxisOffset) + 80.0
            view.frame = CGRect(x: 15, y: yPosition, width: safeAreaWidth, height: cardHeight)
        }
        
        self.view.addSubview(dealerCardView)
        let yPosition = CGFloat(playerCardViews.count) * (cardHeight + yAxisOffset) + 80.0
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
