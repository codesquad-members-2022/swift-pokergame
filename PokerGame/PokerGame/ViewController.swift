//
//  ViewController.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundImage()
    }
    
    private func setBackgroundImage() {
        // Color에 Image넣어야해서 옵셔널바인딩
        guard let backgroundImage = UIImage(named: "bg_pattern.png") else { return }
        view.backgroundColor = UIColor(patternImage: backgroundImage)
    }

}

 
