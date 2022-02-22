//
//  ViewController.swift
//  PockerGameApp
//
//  Created by 김동준 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    private var cards: [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: getPatternImage())
        makeCards()
        addCardToView()
        choiceCard()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func getPatternImage() -> UIImage{
        guard let patternImage = UIImage(named: "bgpattern.png") else {
            return UIImage()
        }
        return patternImage
    }
    
    private func makeCards(){
        guard let cardBackImage = UIImage(named: "cardback.png") else {
            return
        }
        let widthGap = 55.0
        for i in 0 ..< 7{
            let cardView = UIImageView(frame: CGRect(x: (5 + (Double(i) * widthGap)), y: 54.0, width: (widthGap - 5), height: 63.5))
            cardView.image = cardBackImage
            cardView.contentMode = .scaleAspectFit
            cards.append(cardView)
        }
    }
    
    private func addCardToView(){
        for i in cards{
            view.addSubview(i)
        }
    }
    
    private func choiceCard(){
        let card = PockerCard(shape: .hearts, number: .Q)
        let card2 = PockerCard(shape: .clubs, number: .seven)
        print(card2)
    }
}
