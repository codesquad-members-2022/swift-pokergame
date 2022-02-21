//
//  ViewController.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    var cards: [UIImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern") ?? UIImage())
        setImageView()
    }
    
    func setImageView() {
        guard let cardImage = UIImage(named: "card-back") else {return}
        let maxNumberOfCards = 7
        let cardWidth = 50
        let cardHeight = 1.27*Float(cardWidth)
        let spacingFromTop = 47
        for eachImageViewIndex in 0..<maxNumberOfCards {
            let xPosition = CGFloat(5*(1+eachImageViewIndex) + cardWidth*eachImageViewIndex)
            let currentFrame = CGRect(x: CGFloat(xPosition), y: CGFloat(spacingFromTop), width: CGFloat(cardWidth), height: CGFloat(cardHeight))
            let newImageView = UIImageView(frame: currentFrame)
            newImageView.image = cardImage
            self.view.addSubview(newImageView)
            cards.append(UIImageView(frame: currentFrame))
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

