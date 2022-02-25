//
//  PGController.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/25.
//

import UIKit

class CommonLogic{
    func makeUIImage(view: UIView){
        let players = pockerGame.entryPlayers().showPlayers()
        let dealer = pockerGame.entryDealer()
        
        players.forEach{ player in
            guard let card = player.showMyCards().last else{
                return
            }
            let image = UIImage(named: "\(card.description)")
            let imageView = UIImageView(image: image)
            
            view.subviews.forEach{ view in
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
        
        let image = UIImage(named: "\(card)")
        let imageView = UIImageView(image: image)
        
        view.subviews.forEach{ view in
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
}
