//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "bg_pattern") ?? UIImage.init())
        
        let displayWidth = UIScreen.main.bounds.size.width
        let cardWidth = displayWidth / 7
        let cardHeight = cardWidth * 1.27
        for i in 0..<7 {
            let cardBackView: UIImageView! = UIImageView(image: UIImage(named: "card-back"))
            cardBackView.frame = CGRect(x: CGFloat( Int(cardWidth) * i), y: 50, width: cardWidth, height: cardHeight)
            self.view.addSubview(cardBackView)
        }
        
    }

}

