//
//  ViewController.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundImage()
        setCardImageViews()
    }
    
    let cardCountPerRow = 7
    let cardImage = UIImage(named: "card-back")
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setBackgroundImage() {
        guard let backgroundImage = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
    }
    
    func getViewWidth() -> CGFloat {
        let bounds: CGRect = UIScreen.main.bounds
        return bounds.width
    }
    
    func createCardImageView() -> UIImageView {
        let cardImageView = UIImageView()
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.contentMode = .scaleAspectFit
        cardImageView.image = cardImage
        return cardImageView
    }
    
    func setCardImageViews() {
        let margin: CGFloat = 10
        
        let cardImageViewWidth = (getViewWidth()) / CGFloat(cardCountPerRow) - margin
        let cardImageViewHeight = cardImageViewWidth * 1.27
        let cardImageViewY =  CGFloat(50)
        
        for count in 0..<cardCountPerRow {
            let card = createCardImageView()
            let cardImageViewX = (CGFloat(count) * (cardImageViewWidth + margin)) + margin / 2
            
            card.frame = CGRect(x: cardImageViewX, y: cardImageViewY, width: cardImageViewWidth, height: cardImageViewHeight)
            
            view.addSubview(card)
        }
    }
}

