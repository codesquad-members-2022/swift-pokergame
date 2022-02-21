//
//  ViewController.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    var cards = [UIImageView](repeating: UIImageView(), count: 7)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern") ?? UIImage())
        setImageView()
    }
    
    func setImageView() {
        for eachImageViewIndex in 0..<cards.count {
            let xPosition = CGFloat(5*(1+eachImageViewIndex) + 50*eachImageViewIndex)
            let currentFrame = CGRect(x: xPosition, y: 47, width: 50, height: 50*1.27)
            cards[eachImageViewIndex] = UIImageView(frame: currentFrame)
            cards[eachImageViewIndex].image = UIImage(named: "card-back")
            self.view.addSubview(cards[eachImageViewIndex])
        }
    }


}

import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .previewLayout(.sizeThatFits)
            .previewDevice("iPhone 13 Pro")
    }
}
