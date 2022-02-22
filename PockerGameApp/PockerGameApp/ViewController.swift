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
            let cardInfo = makeCardInfo()
            showCardInfo(card: cardInfo)
        }
    }

    func makeImageView(){
        let imageView = UIImageView(image: self.cardImage)

        self.horizonStack.addArrangedSubview(imageView)
    }
    
    func makeCardInfo() -> Card{
        let shapes: [Shape] = [.clover, .dia, .heart, .spade]
        let shapeRandomNum = Int.random(in: 0...3)
        let cardRandomNum = Int.random(in: 1...13)
        
        let cardInfo = Card(number: CardNumber(num: cardRandomNum), shape: shapes[shapeRandomNum])
        
        return cardInfo
    }
    
    func showCardInfo(card: Card){
        print(card.cardInformation())
    }
}
