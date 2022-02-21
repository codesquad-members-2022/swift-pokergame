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
                           PlayerCardView(), PlayerCardView(),
                           PlayerCardView()]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        playerCardViews.enumerated().forEach { index, view in
            self.view.addSubview(view)
            view.frame = CGRect(x: Constants.cardOffset, y: CGFloat(index * 80) + 80.0, width: safeAreaWidth, height: cardHeight)
        }
    }
}
