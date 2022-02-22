//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    let CARD_INSET: CGFloat = 3
    let CARD_COUNT = 5
    var cards: [UIImageView]!
    
    let bgImageName = "bg_pattern"
    let cardImageName = "card-back"
    
    var readableFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bgPattern = UIImage.init(named: bgImageName) {
            self.view.backgroundColor = UIColor.init(patternImage: bgPattern)
        }
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        readableFrame = self.view.readableContentGuide.layoutFrame
        let totalRow: Int = (CARD_COUNT / 7) + (CARD_COUNT % 7 > 0 ? 1 : 0)
        
        for i in 1...totalRow {
            if i == totalRow {
                setStackView(cardNumber: (totalRow == 1 ? CARD_COUNT : 7 % CARD_COUNT))
            } else {
                setStackView(cardNumber: 7)
            }
        }
    }
    
    func setStackView(cardNumber: Int) {
        let cardWidth = (readableFrame.width / CGFloat(7)) - CARD_INSET
        
        cards = (0..<cardNumber).compactMap { _ in
            let imageView = UIImageView(image: UIImage(named: cardImageName))
            imageView.contentMode = .scaleAspectFit
            return imageView
        }
        
        let stackView = UIStackView.init(arrangedSubviews: cards)
        self.view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = CARD_INSET
        stackView.frame = readableFrame
        stackView.frame.size.height = cardWidth * 1.27
    }
    
    @IBAction func makeAndPrintRandomCardTouchUpInside(_ sender: UIButton) {
        print(CardFactory.randomCard().read)
    }
    
    @IBAction func makeAndPrintCardDeckTouchUpInside(_ sender: UIButton) {
        print(CardFactory.deckOfCard().readAll)
    }
    
    @IBAction func makeAndReadRandomCardTouchUpInside(_ sender: UIButton) {
        alert(with: CardFactory.randomCard().read)
    }
    
    @IBAction func makeAndReadCardDeckTouchUpInside(_ sender: UIButton) {
        alert(with: CardFactory.deckOfCard().readAll)
    }
    
    private func alert(with message: String) {
        
        let alert = UIAlertController.init(title: "값은 아래와 같습니다", message: message, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "닫기", style: .destructive) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        
        self.show(alert, sender: nil)
    }
}

