//
//  ViewController.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern") ?? UIImage())
        setImageView()
        let newCard = Card(number: .ace, symbol: .spade)
        printDescription(of: newCard)
    }
    
    func setImageView() {
        guard let cardImage = UIImage(named: "card-back") else {return}
        let maxNumberOfCards = 7
        let cardWidth = CGFloat(50)
        let cardHeight = CGFloat(1.27*Float(cardWidth))
        let spacingFromTop = CGFloat(47)
        let spacingBetweenCards = CGFloat(5)
        let defaultSpace = CGFloat(1)
        for eachImageViewIndex in 0..<maxNumberOfCards {
            let eachImageViewIndex = CGFloat(eachImageViewIndex)
            let xPosition = spacingBetweenCards*(defaultSpace+eachImageViewIndex) + cardWidth*eachImageViewIndex
            let currentFrame = CGRect(x: xPosition, y: spacingFromTop, width: cardWidth, height: cardHeight)
            let newImageView = UIImageView(frame: currentFrame)
            newImageView.image = cardImage
            self.view.addSubview(newImageView)
        }
    }
    
    func printDescription(of target: CustomStringConvertible) {
        print(target)
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

