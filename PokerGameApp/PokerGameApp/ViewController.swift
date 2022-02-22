//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 송태환 on 2022/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setCardViews(count: 7)
    }
    
    // MARK: - Methods
    func configureUI() {
        self.setBackgroundImage()
    }
    
    func setBackgroundImage() {
        guard let image = UIImage(named: "bg_pattern") else {
            return
        }
        
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    func setCardViews(count: Int) {
        let width = Double(self.view.frame.size.width) / Double(count)
        
        for i in 0..<count {
            guard let cardImage = UIImage(named: "card-back") else {
                return
            }
            
            let cardImageView = UIImageView(image: cardImage)
            cardImageView.contentMode = .scaleToFill
            self.view.addSubview(cardImageView)
            cardImageView.frame.size = CGSize(width: width - 5, height: width * 1.27)
            cardImageView.frame.origin.x = cardImageView.frame.width * CGFloat(i) + CGFloat(4 * (i + 1))
            cardImageView.frame.origin.y = self.view.safeAreaLayoutGuide.layoutFrame.origin.y
        }
    }
    
}

