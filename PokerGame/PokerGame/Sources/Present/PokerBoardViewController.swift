//
//  PokerBoardViewController.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation
import UIKit

class PokerBoardViewController: UIViewController {
        
    let pokerOptionView = PokerOptionView()
    let playerCardStackView = UIStackView()
    let playerCardViews = [PlayerCardView(), PlayerCardView(),
                           PlayerCardView(), PlayerCardView()]
    let dealerCardView = PlayerCardView()
    
    let pokerGame = PokerGame()
    
    //MARK: - Override
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        attribute()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        pokerGame.action.pokerStart()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake {
            pokerGame.action.pokerStart()
        }
    }
    
    //MARK: - Method
    
    private func bind() {
        pokerGame.state.updateLayout = { pokerType in
            self.layout(pokerType: pokerType)
        }
        
        pokerGame.state.didCreatePlayers = { players in
            players.enumerated().forEach {
                self.playerCardViews[$0].setCardImage(player: $1)
            }
        }
        
        pokerGame.state.didCreateDealer = { dealer in
            self.dealerCardView.setCardImage(player: dealer)
        }
        
        pokerOptionView.typeButtons.enumerated().forEach { index, button in
            button.addAction(UIAction(handler: { sender in
                (0..<self.pokerOptionView.typeButtons.count).forEach {
                    self.pokerOptionView.typeButtons[$0].isEnabled = index != $0
                }
                self.pokerGame.action.inputPokerType(index == 0 ?.sevenCard : .fiveCard)
            }), for: .touchUpInside)
        }
        
        pokerOptionView.playerButtons.forEach { index, button in
            button.addAction(UIAction(handler: { sender in
                self.pokerOptionView.playerButtons.forEach {
                    $1.isEnabled = index != $0
                }
                
                (0..<self.playerCardViews.count).forEach {
                    self.playerCardViews[$0].alpha = $0 < index ? 1 : 0
                }
                
                self.pokerGame.action.inputPlayerCount(index)
            }), for: .touchUpInside)
        }
    }
    
    private func attribute() {
        if let backImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backImage)
        }
        
        playerCardViews.forEach {
            $0.isHidden = true
        }
        
        playerCardStackView.axis = .vertical
        playerCardStackView.distribution = .fillProportionally
    }
    
    private func layout(pokerType: PokerGame.PokerType = .sevenCard) {
        let safeAreaFrame = self.view.safeAreaLayoutGuide.layoutFrame
        let topOffset = safeAreaFrame.minY
        let leftOffset = 15.0
        let rightOffset = 15.0
        let safeWidth = safeAreaFrame.width - leftOffset - rightOffset
        
        //포커 옵션 레이아웃
        let optionViewHeight = 80.0
        self.view.addSubview(pokerOptionView)
        pokerOptionView.frame = CGRect(x: leftOffset, y: topOffset, width: safeWidth, height: optionViewHeight)
        pokerOptionView.layout()
        
        //플레이어 카드뷰 레이아웃
        let optionViewOffset = 10.0
        let cardStackViewTopOffset = topOffset + optionViewHeight + optionViewOffset
        let cardStackViewHeight = safeAreaFrame.height - cardStackViewTopOffset
        self.view.addSubview(playerCardStackView)
        playerCardStackView.frame = CGRect(x: leftOffset, y: cardStackViewTopOffset, width: safeWidth, height: cardStackViewHeight)
        
        playerCardViews.enumerated().forEach {
            playerCardStackView.addArrangedSubview($1)
            $1.layout()
        }
        playerCardStackView.addArrangedSubview(dealerCardView)
        dealerCardView.layout()
    }
}
