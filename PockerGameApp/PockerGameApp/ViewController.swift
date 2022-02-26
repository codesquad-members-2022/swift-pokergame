//
//  ViewController.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var variant: UISegmentedControl!
    @IBOutlet weak var entries: UISegmentedControl!
    
    private var labelViews: [UILabel] = []
    private var stackViews: [UIStackView] = []
    
    private var variantValue: PockerGame.Variants{
        if variant.selectedSegmentIndex == 0{
            return PockerGame.Variants.fiveCardStud
        } else{
            return PockerGame.Variants.sevenCardStud
        }
    }
    private var entriesValue: PockerGame.Entries{
        if entries.selectedSegmentIndex == 0{
            return PockerGame.Entries.two
        } else if entries.selectedSegmentIndex == 1{
            return PockerGame.Entries.three
        } else{
            return PockerGame.Entries.four
        }
    }
    private var pockerGame: PockerGame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pockerGame = PockerGame(variant: variantValue, entries: entriesValue)
        
        if let pattern = UIImage(named: "bg_pattern"){
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }
        
        addLabelStackView()
    }
    
    func playGame(){
        guard let pockerGame = pockerGame else {
            return
        }
        
        let _ = pockerGame.dealerShuffle()
        
        for _ in 0..<variantValue.caseNumber{
            pockerGame.divideCards()
            makeUIImage()
        }
            
        pockerGame.clearGame()
    }
    
    func makeUIImage(){
        guard let players = pockerGame?.entryPlayers().showPlayers(), let dealer = pockerGame?.entryDealer() else{
            return
        }
        
        players.forEach{ player in
            guard let card = player.showMyCards().last else{
                return
            }
            let image = UIImage(named: "\(card.description)")
            let imageView = UIImageView(image: image)
            
            self.view.subviews.forEach{ view in
                guard let stackView = view as? UIStackView else{
                    return
                }
                
                if stackView.restorationIdentifier == player.name{
                    stackView.addArrangedSubview(imageView)
                }
            }
        }
        
        guard let card = dealer.showMyCards().last else{
            return
        }
        
        let image = UIImage(named: "\(card.description)")
        let imageView = UIImageView(image: image)
        
        self.view.subviews.forEach{ view in
            guard let stackView = view as? UIStackView else{
                return
            }
            
            if stackView.restorationIdentifier == dealer.role{
                stackView.addArrangedSubview(imageView)
            }
        }
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
        labelViews.forEach{ label in
            label.removeFromSuperview()
        }
        stackViews.forEach{ stack in
            stack.removeFromSuperview()
        }
        
        labelViews.removeAll()
        stackViews.removeAll()
    }
    
    func makeViews(){
        guard let players = pockerGame?.entryPlayers().showPlayers(), let dealer = pockerGame?.entryDealer() else{
            return
        }

        let frameX: Double = 30
        var frameY: Double = 130
        let stackViewWidth: Double = 330
        let stackViewHeight: Double = 50 * 1.5
        
        players.forEach{ player in
            let label = UILabel(frame: CGRect(x: frameX, y: frameY, width: 120, height: 30))
            label.text = "Player : \(player.name)"
            label.textColor = .white
            self.labelViews.append(label)
            
            frameY += 30
            
            let stackView = UIStackView(frame: CGRect(x: frameX, y: frameY, width: stackViewWidth, height: stackViewHeight))
            stackView.restorationIdentifier = player.name
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.contentMode = .scaleAspectFit
            stackView.backgroundColor = .white
            self.stackViews.append(stackView)
            
            frameY += stackViewHeight + 20
        }
        
        let label = UILabel(frame: CGRect(x: frameX, y: frameY, width: 120, height: 30))
        label.text = dealer.role
        label.textColor = .white
        label.font = UIFont(name: "System", size: 21)
        self.labelViews.append(label)
        
        frameY += 30
        
        let stackView = UIStackView(frame: CGRect(x: frameX, y: frameY, width: stackViewWidth, height: stackViewHeight))
        stackView.restorationIdentifier = dealer.role
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.contentMode = .scaleAspectFit
        stackView.backgroundColor = .white
        self.stackViews.append(stackView)
    }
    
    @IBAction func variantControllClick(_ sender: Any) {
        pockerGame = PockerGame(variant: variantValue, entries: entriesValue)
        removeLabelStackView()
        addLabelStackView()
    }
    
    @IBAction func entriesControllClick(_ sender: Any) {
        pockerGame = PockerGame(variant: variantValue, entries: entriesValue)
        removeLabelStackView()
        addLabelStackView()
    }
    
    @IBAction func start(_ sender: Any) {
        playGame()
    }
    
    @IBAction func resetGame(_ sender: Any) {
        let _ = pockerGame?.dealerShuffle()
        removeLabelStackView()
        addLabelStackView()
    }
}
