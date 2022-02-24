//
//  TestViewController.swift
//  PokerGameApp
//
//  Created by Joobang Lee on 2022/02/24.
//

import UIKit

class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage()
    }
    
    func backgroundImage(){
        guard let backGround = UIImage(named: "bg_pattern.png") else {return}
        view.backgroundColor = UIColor(patternImage: backGround)
    }
}
