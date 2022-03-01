//
//  DelaerViewController.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/03/01.
//

import UIKit

class DealerViewController: UIViewController {
    private var labelViews: [UILabel] = []
    private var stackViews: [UIStackView] = []
    
    private var dealer: Dealer?
    private var variant = PockerGame.Variants.fiveCardStud
    private var entries = PockerGame.Entries.two
    private var imageViewsIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pattern = UIImage(named: "bg_pattern"){
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }
        
        addLabelStackView()
    }
    
    func getDealerInstance(dealer: Dealer){
        self.dealer = dealer
    }
    
    func getVariantValue(variant: PockerGame.Variants){
        self.variant = variant
    }
    
    func getEntriesValue(entries: PockerGame.Entries){
        self.entries = entries
    }
    
    func makeViews(){
        guard let dealer = dealer else {
            return
        }

        let frameX: Double = 30
        var frameY: Double = 0
        let stackViewWidth: Double = 330
        let stackViewHeight: Double = 50 * 1.5
        
        let label = UILabel(frame: CGRect(x: frameX, y: frameY, width: 120, height: 30))
        label.text = dealer.role
        label.textColor = .white
        label.font = UIFont(name: "System", size: 21)
        self.labelViews.append(label)
        self.view.addSubview(label)
        
        frameY += 30
        
        let stackView = UIStackView(frame: CGRect(x: frameX, y: frameY, width: stackViewWidth, height: stackViewHeight))
        stackView.restorationIdentifier = dealer.role
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.contentMode = .scaleAspectFit
        stackView.backgroundColor = .white
        makeImageView(stackView: stackView)
        self.stackViews.append(stackView)
        self.view.addSubview(stackView)
    }
    
    func makeImageView(stackView: UIStackView){
        for _ in 0..<variant.caseNumber(){
            let imageView = UIImageView()
            stackView.addArrangedSubview(imageView)
        }
    }

    func makeUIImage(){
        guard let card = dealer?.showMyCards().last else{
            return
        }
        
        let image = UIImage(named: "\(card.description)")
        
        self.view.subviews.forEach{ view in
            guard let stackView = view as? UIStackView else{
                return
            }
            
            if stackView.restorationIdentifier == dealer?.role, let imageView = stackView.subviews[imageViewsIndex] as? UIImageView{
                imageView.image = image
            } else{
                return
            }
        }
        
        imageViewsIndex += 1
    }
    
    func addLabelStackView(){
        makeViews()
        labelViews.forEach{ label in
            self.view.addSubview(label)
        }
        stackViews.forEach{ stack in
            self.view.addSubview(stack)
        }
    }
    
    func removeLabelStackView(){
        self.imageViewsIndex = 0
        
        labelViews.forEach{ label in
            label.removeFromSuperview()
        }
        stackViews.forEach{ stack in
            stack.removeFromSuperview()
        }
        
        labelViews.removeAll()
        stackViews.removeAll()
    }
}
