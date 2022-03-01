//
//  PlayersViewController.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/03/01.
//

import UIKit

class PlayersViewController: UIViewController {
    private var labelViews: [UILabel] = []
    private var stackViews: [UIStackView] = []
    
    private var players: InGamePlayers?
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
    
    func getPlayersInstance(players: InGamePlayers){
        self.players = players
    }
    
    func getVariantValue(variant: PockerGame.Variants){
        self.variant = variant
    }
    
    func getEntriesValue(entries: PockerGame.Entries){
        self.entries = entries
    }
    
    func makeViews(){
        guard let players = players?.showPlayers() else{
            return
        }

        let frameX: Double = 30
        var frameY: Double = 0
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
    }
    
    func makeImageView(stackView: UIStackView){
        for _ in 0..<variant.caseNumber(){
            let imageView = UIImageView()
            stackView.addArrangedSubview(imageView)
        }
    }
    
    func makeUIImage(){
        guard let players = players?.showPlayers() else{
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
