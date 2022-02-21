//
//  ViewController.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //StatusBar
        
        //ViewBackgroung Pattern
        self.view.backgroundColor = UIColor(patternImage: Image.backgroundPatternImage)
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

