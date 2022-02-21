//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    let bgImageName = "bg_pattern"
    var backgroundImageView: (() -> UIImageView?)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        # Step1
        if let bgPattern = UIImage.init(named: bgImageName) {
            self.view.backgroundColor = UIColor.init(patternImage: bgPattern)
        }
        
//        # Step2
//        backgroundImageView = { [self] in
//
//            guard let image = UIImage.init(named: bgImageName) else { return nil }
//
//            let imageView = UIImageView(image: UIImage.init(named: bgImageName))
//            imageView.frame = self.view.frame
//            imageView.contentMode = .center
//            return imageView
//        }
//
//        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(changeBackground))
//        self.view.addGestureRecognizer(gesture)
//        self.view.isUserInteractionEnabled = true
    }
    
//    @objc func changeBackground() {
//        if let imageView = self.view.subviews.filter({type(of: $0.self) == UIImageView.self}).first {
//            imageView.removeFromSuperview()
//        } else if let imageView = backgroundImageView() {
//            self.view.addSubview(imageView)
//        }
//    }
}

