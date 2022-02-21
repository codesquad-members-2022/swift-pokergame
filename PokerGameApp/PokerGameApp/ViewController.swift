//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    func showCardImages() {
        let cardOffset = 5.0
        let cardWidth = (view.frame.width - (cardOffset * 8)) / 7
        let cardHeight = cardWidth * 1.27
        var xPos = 5.0
        let yPos = 60.0
        
        for _ in 0..<7 {
            let cardImage = UIImageView(image: UIImage(named: "card-back"))
            cardImage.frame = CGRect(x: xPos , y: yPos, width: cardWidth, height: cardHeight)
            cardImage.contentMode = .scaleAspectFit
            view.addSubview(cardImage)
            
            xPos += cardWidth + cardOffset
        }
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let backgroundPattern = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backgroundPattern)
        }
        
        showCardImages()
    }
}
