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
        print(cards)
    }
}

