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
        createCardSet()
    }
    func createCardSet(){
        let screenSize = UIScreen.main.bounds
        let cardWidth = (screenSize.width - 32) / 7
        let cardHeight = cardWidth * 1.27
        let cardBackSide = UIImage(named: "card-back.png")
        let margin : CGFloat = 55
        for i in 0..<7 {
            let imageView = UIImageView(frame: CGRect(x: (margin * CGFloat(i))+4, y: 40, width: cardWidth,height: cardHeight))
            imageView.contentMode = .scaleToFill
            imageView.layer.cornerRadius = 3
            imageView.clipsToBounds = true
            imageView.image = cardBackSide
            self.view.addSubview(imageView)
        }
    }
}

