//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    let CARD_INSET: CGFloat = 3
    let CARD_COUNT = 7
    
    let bgImageName = "bg_pattern"
    let cardImageName = "card-back"
    var backgroundImageView: ((CGFloat) -> UIImageView?)!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let bgPattern = UIImage.init(named: bgImageName) {
            self.view.backgroundColor = UIColor.init(patternImage: bgPattern)
        }
        
        let readableFrame = view.readableContentGuide.layoutFrame
        let widthExceptSafeAreaAndInset = readableFrame.width - (CARD_INSET * CGFloat(CARD_COUNT))
        
        backgroundImageView = { [self] (width: CGFloat) -> UIImageView? in
            
            let imageView = UIImageView(image: UIImage(named: cardImageName))
            imageView.contentMode = .scaleToFill
            imageView.frame.size = CGSize(width: width, height: width * 1.27)
            
            return imageView
        }
        
        for _ in 0..<CARD_COUNT {
            
            guard let imageView = backgroundImageView(widthExceptSafeAreaAndInset / 7) else {
                continue
            }
            
            if view.subviews.count == 0 {
                
                imageView.frame.origin = CGPoint(
                    x: readableFrame.minX,
                    y: readableFrame.minY
                )
                view.addSubview(imageView)
                continue
            }
            
            view.addSubview(imageView)
            let lastSubView = view.subviews.max(by: {$0.frame.maxX < $1.frame.maxX})!
            imageView.frame.origin = CGPoint(
                x: lastSubView.frame.maxX + CARD_INSET,
                y: lastSubView.frame.origin.y
            )
            
        }
    }
}

