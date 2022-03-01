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
        
        let pokerCard = PokerCard(suit: .hearts, rank: .Queen)
        let displayCard = pokerCard.makeCard()
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

}
  
    

