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
        //MARK: 이미지를 옵셔널 언래핑을 하지 않고 쓸 수 있는 방법
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        var offset = 0
        // UIImageView를 7개 선언
        for _ in 0..<7 {
            createCard(XCoordinate: letfMargin + offset)
            // 사이 간격 카드 하나보다 약간 넓게 조정
            offset += SizeOfCard.width + 3
        }
        //TODO: 클래스의 인스턴스를 let으로 선언했을 때와 var로 선언했을 때의 차이
        let card = Card(shape: .club, rank: .ace)
        print("\(card.description)")
    }
    
    func createCard(XCoordinate: Int) {
        let card = UIImageView(frame: CGRect(x: XCoordinate, y: topMargin, width: SizeOfCard.width, height: SizeOfCard.height))
        card.image = UIImage(named: "card-back.png")
        self.view.addSubview(card)
    }
}


