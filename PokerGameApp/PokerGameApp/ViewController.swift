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
        print(self.view.frame.width, self.view.frame.height)
        let width = self.view.frame.width / 7
        let height = width * 1.27
        
        for i in 0..<7 {
            cards[i].frame.size.width = width
            cards[i].frame.size.height = height
            view.addSubview(cards[i])
        }
        
        print("추가된 이미지뷰의 수", view.subviews.count)
    }
}

