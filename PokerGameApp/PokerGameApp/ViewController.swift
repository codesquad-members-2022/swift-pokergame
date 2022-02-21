//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    let CARD_INSET: CGFloat = 4
    let CARD_COUNT = 7
    
    let bgImageName = "bg_pattern"
    let cardImageName = "card-back"
    var imageViewFactory: ((CGFloat) -> UIImageView?)!
    
    var readableFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        readableFrame = view.safeAreaLayoutGuide.layoutFrame
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let bgPattern = UIImage.init(named: bgImageName) {
            self.view.backgroundColor = UIColor.init(patternImage: bgPattern)
        }
        
        let readableWidthExceptInset = readableFrame.width - (CARD_INSET * CGFloat(CARD_COUNT+1))
        
        imageViewFactory = { [self] (width: CGFloat) -> UIImageView? in
            
            let imageView = UIImageView(image: UIImage(named: cardImageName))
            imageView.frame.size = CGSize(width: width, height: width * 1.27)
            return imageView
        }
        
        for _ in 0..<CARD_COUNT {
            
            guard let imageView = imageViewFactory(readableWidthExceptInset / 7) else {
                continue
            }
            
            view.addSubview(imageView)
            
            let lastCardInPile = view.subviews.max(by: {$0.frame.maxX < $1.frame.maxX})!
            let isFirst = view.subviews.count == 1
            
            let position = CGPoint(
                x: (isFirst ? 0 : lastCardInPile.frame.maxX) + CARD_INSET,
                y: readableFrame.minY
            )
            
            imageView.frame.origin = position
        }
    }
}

