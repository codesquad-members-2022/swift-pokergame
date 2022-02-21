//
//  ViewController.swift
//  PockerGameApp
//
//  Created by Bumgeun Song on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let patternImage = UIImage(named: "BackgroundPattern") {
            self.view.backgroundColor = UIColor(patternImage: patternImage)
        }
    }


}

