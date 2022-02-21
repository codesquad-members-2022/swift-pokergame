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
        let aImageView : UIImageView = createUIImageView(x:4)
        let bImageView : UIImageView = createUIImageView(x:aImageView.frame.minX+55)
        let cImageView : UIImageView = createUIImageView(x:bImageView.frame.minX+55)
        let dImageView : UIImageView = createUIImageView(x:cImageView.frame.minX+55)
        let eImageView : UIImageView = createUIImageView(x:dImageView.frame.minX+55)
        let fImageView : UIImageView = createUIImageView(x:eImageView.frame.minX+55)
        let gImageView : UIImageView = createUIImageView(x:fImageView.frame.minX+55)
        for i in [aImageView,bImageView,cImageView,dImageView,eImageView,fImageView,gImageView]{
            self.view.addSubview(i)
        }
    }
    func createUIImageView(x: CGFloat) -> UIImageView{
        let screenSize = UIScreen.main.bounds
        let cardWidth = (screenSize.width - 32) / 7
        let cardHeight = cardWidth * 1.27
        let cardBackSide = UIImage(named: "card-back.png")
        let imageView = UIImageView(frame: CGRect(x: x, y: 40, width: cardWidth,height: cardHeight))
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 3
        imageView.clipsToBounds = true
        imageView.image = cardBackSide
        return imageView
    }
}

