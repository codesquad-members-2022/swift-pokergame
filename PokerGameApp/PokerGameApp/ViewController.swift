//
//  ViewController.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pattern: UIImage = #imageLiteral(resourceName: "bg_pattern")
        view.backgroundColor = UIColor(patternImage: pattern)
        
        addCardImages(superView: self.view, count: 7)
    }

    private func addCardImages(superView: UIView, count: Int) {
        let backgroundSize = CGSize(width: superView.bounds.width * 0.9, height: 100)
        let backgroundPointX = (superView.bounds.width - backgroundSize.width) / 2
        let background = UIView(frame: CGRect(origin: CGPoint(x: backgroundPointX, y: 100),
                                size: backgroundSize))
        background.backgroundColor = .brown
        superView.addSubview(background)
        
        let spacing: CGFloat = 10
        let cardWidth = (background.frame.size.width - spacing * CGFloat(count - 1)) / CGFloat(count)
        let cardHeight = cardWidth * 1.27
        for cardIndex in 0..<count {
            let cardBack: UIImage = #imageLiteral(resourceName: "card-back")
            let space = CGFloat(cardIndex == 0 ? 0 : spacing * CGFloat(cardIndex))
            let x = CGFloat(cardIndex) * cardWidth + space
            let cardImageView =  UIImageView(frame: CGRect(x: x, y: 0, width: cardWidth, height: cardHeight))
            cardImageView.image = cardBack
            background.addSubview(cardImageView)
        }
    }
}

