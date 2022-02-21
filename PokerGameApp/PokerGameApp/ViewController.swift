//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    var cards = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        
        for i in 0..<7 {
            cards.append(UIImageView(image: UIImage(named: "card-back")))
        }
        
        // 화면 크기
        let width = self.view.frame.width / 7
        let height = width * 1.27
        var xPos = 0.0
        var yPos = 60.0
        
        for i in 0..<7 {
            cards[i].frame = CGRect(x: xPos, y: yPos, width: width, height: height)
            view.addSubview(cards[i])
            
            xPos = xPos + width
        }
    }
}

