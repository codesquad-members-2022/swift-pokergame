//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 송태환 on 2022/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackgroundImage()
    }

    // MARK: - Methods
    func setBackgroundImage() {
        guard let image = UIImage(named: "bg_pattern") else {
            return
        }
        
        self.view.backgroundColor = UIColor(patternImage: image)
    }

}

