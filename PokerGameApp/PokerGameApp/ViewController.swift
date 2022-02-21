//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
//    private var barStyle: UIStatusBarStyle = .lightContent {
//        willSet {
//            setNeedsStatusBarAppearanceUpdate()
//        }
//    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return barStyle
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondViewController")
            vc.modalPresentationStyle = .fullScreen
            UIApplication.shared.statusBarStyle = .darkContent
            self.present(vc, animated: true, completion: nil)
        }
    }
}

