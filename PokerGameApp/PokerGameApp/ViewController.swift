//
//  ViewController.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackgroundImage()
        addCardImageViewIntoCardStackView(repeat: 7)
        
        let myCard = Card(faceData: CardData.FaceData.spade, numericData: CardData.NumericData.jack)
        print(myCard.description)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setUpBackgroundImage() {
        guard let backgroundImage = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
    }
    
    private func createCardImageView(cardImage: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = cardImage
        return imageView
    }
    
    private func createCardStackView() -> UIStackView {
        let cardStackView = UIStackView()
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        cardStackView.axis = .horizontal
        cardStackView.distribution = .fillEqually
        cardStackView.spacing = 5
        return cardStackView
    }
    
    private func setUpCardStackView(cardStackView: UIStackView) {
        self.view.addSubview(cardStackView)
        cardStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        cardStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        cardStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.95).isActive = true
        cardStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
    }
    
    private func addCardImageViewIntoCardStackView(repeat count: Int = 1) {
        guard let cardImage = UIImage(named: "card-back") else { return }
        let cardStackView = createCardStackView()
        setUpCardStackView(cardStackView: cardStackView)
        
        for _ in 0..<count {
            let cardImageView = createCardImageView(cardImage: cardImage)
            cardStackView.addArrangedSubview(cardImageView)
        }
    }
}
