//
//  ViewController.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backGround = UIImage(named: "bg_pattern.png"){
            self.view.backgroundColor = UIColor(patternImage: backGround)
        }
        let card = Card(shape: .heart, number: .Q)
        print(card)
        createHand(numberOfCard: 7)
    }
    func createHand(numberOfCard: Int){
        let screenSize = UIScreen.main.bounds
        let blank : CGFloat = 4
        let totalBlank : CGFloat = CGFloat(numberOfCard + 1) * blank
        let cardWidth = (screenSize.width - totalBlank) / CGFloat(numberOfCard)
        let cardHeight = cardWidth * 1.27
        let cardBackSide = UIImage(named: "card-back.png")
        let margin : CGFloat = cardWidth + blank
        for i in 0..<Int(numberOfCard) {
            let imageView = UIImageView(frame: CGRect(x: (margin * CGFloat(i))+blank, y: 40, width: cardWidth,height: cardHeight))
            imageView.contentMode = .scaleToFill
            imageView.layer.cornerRadius = 3
            imageView.clipsToBounds = true
            imageView.image = cardBackSide
            self.view.addSubview(imageView)
        }
    }
    
}


