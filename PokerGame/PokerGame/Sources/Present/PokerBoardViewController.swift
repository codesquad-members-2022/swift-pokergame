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
    
    let pokerGame = PokerGame(playType: .sevenCard, playerCount: 3)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokerGame.delegate = self
        attribute()
        layout()
    }
    
    private func attribute() {
        if let backImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backImage)
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
            view.frame = CGRect(x: 30, y: yPosition, width: safeAreaWidth, height: cardHeight)
        }
    }
}

extension PokerBoardViewController: PokerGameDelegate {
    func player(index: Int, player: Player) {
//        let playerView = playerCardViews[index]
//        playerView.cards.forEach {
//            $0.image =
//        }
    }
    
    func dealer(dealer: Player) {
        
    }
}
