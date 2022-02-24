//
//  ViewController.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundImage()
        addCard(count: 7)
        
        var cardDeck = CardDeck()
        print(cardDeck.description)
        
    }
    
    private func setBackgroundImage() {
        // Color에 Image넣어야해서 옵셔널바인딩
        guard let backgroundImage = UIImage(named: "bg_pattern.png") else { return }
        view.backgroundColor = UIColor(patternImage: backgroundImage)
    }
    
    private func addCard(count: Int) {
        let card = "card-back.png"
        let width = view.bounds.width / Double(count)
        let hight = width * 1.27
        var positionX = 0.0
        let image = UIImage(named: card)
        
        for addImage in 0..<count {
            let imageView = UIImageView(image: image)
            let margin = 3.0
            
            imageView.frame = CGRect(x: positionX, y: 50, width: width - margin, height: hight)
            
            positionX += width
            view.addSubview(imageView)
        }
        
    }
}
