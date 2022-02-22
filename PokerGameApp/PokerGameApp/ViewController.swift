//
//  ViewController.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    var  headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern.png")!)
        
        headerView = UIView()
        headerView.backgroundColor = .red
        self.view.addSubview(headerView)
    }
}

