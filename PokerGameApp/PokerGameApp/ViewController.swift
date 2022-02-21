//
//  ViewController.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let backGround = UIImage(named: "bg_pattern.png"){
            self.view.backgroundColor = UIColor(patternImage: backGround)
        }
    }


}

