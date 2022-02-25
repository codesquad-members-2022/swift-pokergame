//
//  ViewController.swift
//  PockerGameApp
//
//  Created by Jason on 2022/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBackground()
        getScreenWidth()
    }
    
    private func setBackground() {
        guard let patternImage: UIImage = UIImage(named: "bg_pattern.png") else {
            return
        }
        self.view.backgroundColor = UIColor(patternImage: patternImage)
    }
    
    private func getScreenWidth() -> CGFloat {
        let bounds: CGRect = UIScreen.main.bounds // (0.0, 0.0, 390.0, 844.0)
        return bounds.width
    }
    
    
}

