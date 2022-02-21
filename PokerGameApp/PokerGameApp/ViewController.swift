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
        
        guard let backgroundImage = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
    

}

