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
        let displayHeight = UIScreen.main.bounds.size.height
        let cardWidth = displayWidth / 7
        let cardHeight = cardWidth * 1.27
        var cardBackView: UIImageView! = UIImageView(frame: CGRect(x: 10, y: 50, width: cardWidth, height: cardHeight))
        cardBackView.image = UIImage(named: "card-back")
        cardBackView.frame(forAlignmentRect: CGRect(x: 100, y: 100, width: cardWidth, height: cardHeight))
        self.view.addSubview(cardBackView)
        
        
    }


}

