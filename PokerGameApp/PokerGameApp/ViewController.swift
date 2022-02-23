//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 허태양 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        addCardToView()
    }
    
    func setBackground() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern.png")!)
    }
    
    func addCardToView() {
        let screenWidth = UIScreen.main.bounds.width
        let cardWidth = screenWidth / 7
        let image = UIImage(named: "card-back.png")!
        
        for i in 0..<7 {
            let imageView = UIImageView()

            imageView.contentMode = .scaleToFill
            imageView.image = image
            imageView.frame = CGRect(x: CGFloat(i) * cardWidth, y: 35, width: cardWidth, height: cardWidth * 1.27)
            
            self.view.addSubview(imageView)
        }
    }


}

