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
        
        addPattern(to: self.view, pattern: #imageLiteral(resourceName: "bg_pattern"))
        addCardImageContainerView(superView: self.view, cardCount: 7)
    }
    
    private func addPattern(to view: UIView, pattern: UIImage) {
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
    }

    private func addCardImageContainerView(superView: UIView, cardCount: Int) {
        let background = createChildView(superView, multiply: 0.9)
        superView.addSubview(background)
        
        let spacing: CGFloat = 10
        let cardWidth = (background.frame.size.width - spacing * CGFloat(cardCount - 1)) / CGFloat(cardCount)
        let cardHeight = cardWidth * 1.27
        let cardBack: UIImage = #imageLiteral(resourceName: "card-back")
        for cardIndex in 0..<cardCount {
            let space = CGFloat(cardIndex == 0 ? 0 : spacing * CGFloat(cardIndex))
            let x = CGFloat(cardIndex) * cardWidth + space
            let cardImageView =  UIImageView(frame: CGRect(x: x, y: 0, width: cardWidth, height: cardHeight))
            cardImageView.image = cardBack
            background.addSubview(cardImageView)
        }
    }
    
    private func createChildView(_ superView: UIView, multiply: CGFloat) -> UIView {
        let backgroundSize = CGSize(width: superView.bounds.width * multiply, height: 100)
        let backgroundPointX = (superView.bounds.width - backgroundSize.width) / 2
        return UIView(frame: CGRect(origin: CGPoint(x: backgroundPointX, y: 100),
                                size: backgroundSize))
    }
}

