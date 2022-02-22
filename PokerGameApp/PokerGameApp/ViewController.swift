//
//  ViewController.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern.png")!)
        var index = 0
        for _ in 0..<7 {
            createCard(point_x: 7 + index)
            index += 54
        }

    }
    func createCard(point_x: Int) {
        let card = UIImageView(frame: CGRect(x: point_x, y: 50, width: 51, height: 65))
        card.image = UIImage(named: "card-back.png")
        self.view.addSubview(card)
    }
}


