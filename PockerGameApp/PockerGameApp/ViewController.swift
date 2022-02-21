//
//  ViewController.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    private let cardImage = UIImage(named: "card-back")
    private var cardXPosition: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pattern = UIImage(named: "bg_pattern"){
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }
        
        for _ in 0...6{
            makeImageView()
        }
    }

    func makeImageView(){
        let cardWidth: Double = 54
        let cardHeight: Double = cardWidth * 1.27
        
        let imageView = UIImageView(frame: CGRect(x: self.cardXPosition, y: 50, width: cardWidth, height: cardHeight))
        imageView.image = self.cardImage
        
        // 나열을 위해 x 값 변경 (카드 가로 54 / 카드 간격 2 ; 13pro 가로 390)
        self.cardXPosition += 56
        
        self.view.addSubview(imageView)
    }
}

