//
//  ViewController.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    private let topMargin = 50
    private let letfMargin = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // if let 과 guard let 의 차이를 이용해서 상수 처럼 사용
        guard let background = UIImage(named: "bg_pattern.png") else { return }
        self.view.backgroundColor = UIColor(patternImage: background)
        var offset = 0
        // UIImageView를 7개 선언
        for _ in 0..<7 {
            createCard(XCoordinate: letfMargin + offset)
            // 사이 간격 카드 하나보다 약간 넓게 조정
            offset += SizeOfCard.width + 3
        }
        let card = Card(shape: .club, rank: .ace)
        print("\(card.filp())")
    }
    
    func createCard(XCoordinate: Int) {
        let card = UIImageView(frame: CGRect(x: XCoordinate, y: topMargin, width: SizeOfCard.width, height: SizeOfCard.height))
        card.image = UIImage(named: "card-back.png")
        self.view.addSubview(card)
    }
}


