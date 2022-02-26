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
    @IBOutlet weak var playButton: UIButton!
    
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
    
    private var showNextTurnButton: Bool = false
    private var imageViewsIndex = 0
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
    }
    
    func divideCards(){
        pockerGame?.divideCards()
        makeUIImage()
    }
    
    func replayGame(){
        imageViewsIndex = 0
        showNextTurnButton = false
        playButton.setTitle("Play", for: .normal)
        
        pockerGame?.clearGame()
        let _ = pockerGame?.dealerShuffle()
        removeLabelStackView()
        addLabelStackView()
    }
    
    func makeImageView(stackView: UIStackView){
        for _ in 0..<variantValue.caseNumber{
            let imageView = UIImageView()
            stackView.addArrangedSubview(imageView)
        }
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
            
            self.view.subviews.forEach{ view in
                guard let stackView = view as? UIStackView else{
                    return
                }
                
                if stackView.restorationIdentifier == player.name, let imageView = stackView.subviews[imageViewsIndex] as? UIImageView{
                    imageView.image = image
                } else{
                    return
                }
            }
        }
        
        guard let card = dealer.showMyCards().last else{
            return
        }
        
        let image = UIImage(named: "\(card.description)")
        
        self.view.subviews.forEach{ view in
            guard let stackView = view as? UIStackView else{
                return
            }
            
            if stackView.restorationIdentifier == dealer.role, let imageView = stackView.subviews[imageViewsIndex] as? UIImageView{
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
            makeImageView(stackView: stackView)
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
        makeImageView(stackView: stackView)
        self.stackViews.append(stackView)
    }
    
    @IBAction func variantControllClick(_ sender: Any) {
        pockerGame?.changeVariant(variant: variantValue)
        removeLabelStackView()
        addLabelStackView()
        
        imageViewsIndex = 0
        showNextTurnButton = false
        playButton.setTitle("Play", for: .normal)
    }
    
    @IBAction func entriesControllClick(_ sender: Any) {
        pockerGame = PockerGame(variant: variantValue, entries: entriesValue)
        removeLabelStackView()
        addLabelStackView()
        
        imageViewsIndex = 0
        showNextTurnButton = false
        playButton.setTitle("Play", for: .normal)
    }
    
    @IBAction func play(_ sender: Any) {
        if showNextTurnButton{
            playGame()
            showNextTurnButton.toggle()
        } else{
            guard let cardsCount = pockerGame?.entryDealer().showMyCards().count else{
                return
            }
            playButton.setTitle("Dividing", for: .normal)
            
            if cardsCount < variantValue.caseNumber - 1{
                divideCards()
            } else if cardsCount == variantValue.caseNumber - 1{
                divideCards()
                playButton.setTitle("ReGame", for: .normal)
            } else{
                replayGame()
            }
        }
    }
    
    @IBAction func resetGame(_ sender: Any) {
        replayGame()
    }
}
