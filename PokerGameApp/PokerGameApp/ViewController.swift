//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 최예주 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern") ?? UIImage())
        
        configureCard()
                                            
    }
    
    func configureCard(){
        
        let screenWidth = UIScreen.main.bounds.size.width
        let cardImage = UIImage(named: "card-back") ?? UIImage()
        let gap = 5.0
        
        for i in 0..<7 {
            
            let cardXPosition: CGFloat =  CGFloat(CGFloat(i) * (screenWidth/7.0) + gap )
        
            let card = UIImageView(frame: CGRect(x: cardXPosition , y: 70, width: screenWidth/7.0 - gap, height: (screenWidth/7.0 - gap) * 1.25))
            
            card.image = cardImage
            card.contentMode = .scaleAspectFit
      
            self.view.addSubview(card)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}

