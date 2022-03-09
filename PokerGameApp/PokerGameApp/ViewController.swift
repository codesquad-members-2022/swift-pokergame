//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Joobang Lee on 2022/02/23.
//

import UIKit

class ViewController: UIViewController{
   
    var uiView = UIView()
    let cardImageView:[UIImageView] = (0..<7).map({_ in UIImageView()})

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cardImage()
        
        testCardDeck()
    }

    func backgroundImage(){
        guard let backGround = UIImage(named: "bg_pattern.png") else {return}
        view.backgroundColor = UIColor(patternImage: backGround)
    }
    
    func cardImage(){
        self.view.addSubview(uiView)
        uiView.frame = self.view.safeAreaLayoutGuide.layoutFrame
        uiView.backgroundColor = .clear
        
        for i in 0..<7{
            self.uiView.addSubview(cardImageView[i])
            cardImageView[i].image = UIImage(named: "card-back.png")

            let cardWidth = (uiView.frame.width / 7)
            let cardHeight = cardWidth * 1.27
            let margin = 2.5
            cardImageView[i].frame = CGRect(x: (cardWidth * CGFloat(i)), y: 0, width: (cardWidth - margin), height: cardHeight)
        }
    }
    
    func testCardDeck(){
        let pokerCardDeck = PokerCardDeck()
        let pokerCount1 = pokerCardDeck.count()
        pokerCardDeck.shuffle()
        let pokerPicking1 = pokerCardDeck.removeOne()
        let pokerPicking2 = pokerCardDeck.removeOne()
        let pokerCount2 = pokerCardDeck.count()

        print("> 카드 초기화")
        print("카드 전체를 초기화했습니다.")
        print("총 \(pokerCount1)장의 카드가 있습니다.\n")
        
        print("> 카드 섞기")
        print("전체 \(pokerCount1)장의 카드를 섞었습니다.\n")
        
        print(">  카드 하나 뽑기")
        print("\(pokerPicking1)\n")
        
        print(">  카드 하나 뽑기")
        print("\(pokerPicking2)\n")
        print("총 \(pokerCount2)장의 카드가 남아있습니다.")
    }
}
  
    

