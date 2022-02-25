//
//  ViewController.swift
//  PockerGameApp
//
//  Created by Jason on 2022/02/24.
//

import UIKit

class ViewController: UIViewController {
    let numberOfCard = 7
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBackground()
        createCardRect()
    }
    
    // Background 설정
    private func setBackground() {
        guard let patternImage: UIImage = UIImage(named: "bg_pattern.png") else {
            return
        }
        self.view.backgroundColor = UIColor(patternImage: patternImage)
    }
    
    // Screen의 Coordinate Value 찾기
    private func getScreenWidth() -> CGFloat {
        let bounds: CGRect = UIScreen.main.bounds // (0.0, 0.0, 390.0, 844.0)
        return bounds.width
    }
    
    // 카드 7개 만들기
    private func createCardRect() {
        for cardCount in 0...numberOfCard {
            let imageCard = UIImageView()
            imageCard.image = UIImage(named: "card-back.png")
            
            let cardWidth = getScreenWidth() / CGFloat(numberOfCard)
            let cardHeight = cardWidth * 1.27
            let cardCoordinateX = (CGFloat(cardCount) * cardWidth)
            let cardCoordinateY = CGFloat(50)
            
            imageCard.frame = CGRect(x: cardCoordinateX, y: cardCoordinateY, width: cardWidth, height: cardHeight)
            
            view.addSubview(imageCard)
        }
    }
    
}

