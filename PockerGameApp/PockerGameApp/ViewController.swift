//
//  ViewController.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    private let cardImage = UIImage(named: "card-back")
    
    @IBOutlet weak var horizonStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        horizonStack.frame.size.height = horizonStack.frame.width / 7 * 1.27
        horizonStack.distribution = .fillEqually
        horizonStack.spacing = 3
        
        if let pattern = UIImage(named: "bg_pattern"){
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }
        
        for _ in 0...6{
            makeImageView()
            
            if let cardInfo = makeRandomCardInfo(){
                showCardInfo(card: cardInfo)
            } else{
                let alert = UIAlertController(title: "잘못된 호출", message: "모양이나 숫자 입력이 잘못되었습니다. 다시 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
                self.present(alert, animated: true)
            }
        }
        
        testCardDeck()
    }

    func makeImageView(){
        let imageView = UIImageView(image: self.cardImage)

        self.horizonStack.addArrangedSubview(imageView)
    }
    
    func makeRandomCardInfo() -> Card?{
        guard let cardRandomShape = Card.Shape.allCases.randomElement(), let cardRandomNum = Card.CardNumber.allCases.randomElement() else{
            return nil
        }
        
        let cardInfo = Card(number: cardRandomNum, shape: cardRandomShape)
        
        return cardInfo
    }
    
    func showCardInfo(card: Card){
        // description 생략 시에도 description을 가져와서 출력
        print(card)
    }
    
    func testCardDeck(){
        // 카드 초기화
        var deck = CardDeck()
        // 초기화 카드 수 52장 확인
        let firstDecks = deck.count()
        
        // 카드 셔플
        deck.shuffle()
        
        deck.reset()
        
        // 카드 뽑기
        let card1 = deck.removeOne()
        let secondDecks = deck.count()
        
        // 카드 또뽑기
        let card2 = deck.removeOne()
        let thirdDecks = deck.count()
        
        // 카드 리셋
        deck.reset()
        let fourthDecks = deck.count()
    }
}
