//
//  PokerBoardViewController.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation
import UIKit

class PokerBoardViewController: UIViewController {
    
    let cardContainerView = UIView()
    let cards: [UIImageView] = Array(repeating: UIImageView(), count: 7)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        attribute()
        layout()
    }
    
    private func bind() {
        
    }
    
    private func attribute() {
        if let backImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backImage)
        }
        cardContainerView.backgroundColor = .red
    }
    
    private func layout() {
        self.view.addSubview(cardContainerView)
        cards.forEach {
            cardContainerView.addSubview($0)
        }
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        cardContainerView.translatesAutoresizingMaskIntoConstraints = false
        cardContainerView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        cardContainerView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        cardContainerView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        cardContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
