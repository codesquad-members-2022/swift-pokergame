//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 이준우 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
    }
    
    func setBackgroundColor(){
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "bg_pattern")!)
    }

}

