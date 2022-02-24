//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 송태환 on 2022/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        
        return stack
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        OutputView.printCard(card: Card(rank: .ace, suit: .spade))
        OutputView.printCard(card: Card(rank: .king, suit: .diamond))
        OutputView.printCard(card: Card(rank: .ten, suit: .heart))
    }
    
    // MARK: - Methods
    func configureUI() {
        self.setBackgroundImage()
        self.view.setBounds(x: 0, y: -44)
        self.setCardViews(count: 7)
    }
    
    func setBackgroundImage() {
        guard let image = UIImage(named: "bg_pattern") else {
            return
        }
        
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    func setCardViews(count: Int) {
        guard let cardImage = UIImage(named: "card-back") else {
            return
        }
        
        let width = Double(self.view.frame.size.width) / Double(count)
        
        for i in 0..<count {
            let cardImageView = UIImageView(image: cardImage)
            cardImageView.contentMode = .scaleToFill
            cardImageView.frame.size = CGSize(width: width - 5, height: width * 1.27)
            cardImageView.frame.origin.x = cardImageView.frame.width * CGFloat(i) + CGFloat(4 * (i + 1))
            cardImageView.frame.origin.y = self.view.safeAreaLayoutGuide.layoutFrame.origin.y
            self.stackView.addSubview(cardImageView)
        }
        
        self.view.addSubview(stackView)
    }
    
}

extension UIView {
    
    func setBounds(x: Int, y: Int) {
        self.bounds.origin.x = CGFloat(x)
        self.bounds.origin.y = CGFloat(y)
    }
    
}
