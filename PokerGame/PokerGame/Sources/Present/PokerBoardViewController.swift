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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        layout()
        
        pokerGame.action.pokerReset()
        pokerGame.action.pokerPlay()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake {
            pokerGame.action.pokerPlay()
        }
    }
    
    //MARK: - Method
    
    private func bind() {
        pokerOptionView.bind(pokerGame: pokerGame)
        
        pokerGame.state.updateUi = { playerNames in
            (0..<self.playerCardViews.count).forEach {
                let cardView = self.playerCardViews[$0]
                let isEnable = $0 < playerNames.count
                cardView.alpha = isEnable ? 1 : 0
                if isEnable {
                    cardView.name.text = playerNames[$0]
                    cardView.name.sizeToFit()
                }
            }
            self.dealerCardView.name.text = "Dealer"
            self.dealerCardView.name.sizeToFit()
        }
        
        pokerGame.state.givePlayerCard = { index, cardIndex, card in
            self.playerCardViews[index].setCard(at: cardIndex, card: card)
        }
        
        pokerGame.state.giveDealerCard = { cardIndex, card in
            self.dealerCardView.setCard(at: cardIndex, card: card)
        }
    }
    
    private func attribute() {
        if let backImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: backImage)
        }
        
        playerCardStackView.axis = .vertical
        playerCardStackView.distribution = .fillProportionally
    }
    
    private func layout() {
        let safeAreaFrame = self.view.safeAreaLayoutGuide.layoutFrame
        let topOffset = safeAreaFrame.minY
        let leftOffset = 15.0
        let rightOffset = 15.0
        let safeWidth = safeAreaFrame.width - leftOffset - rightOffset
        
        //포커 옵션 레이아웃
        let optionViewHeight = 80.0
        self.view.addSubview(pokerOptionView)
        pokerOptionView.frame = CGRect(x: leftOffset, y: topOffset, width: safeWidth, height: optionViewHeight)
        
        //플레이어 카드뷰 레이아웃
        let optionViewOffset = 10.0
        let cardStackViewTopOffset = topOffset + optionViewHeight + optionViewOffset
        let cardStackViewHeight = safeAreaFrame.height - cardStackViewTopOffset
        self.view.addSubview(playerCardStackView)
        playerCardStackView.frame = CGRect(x: leftOffset, y: cardStackViewTopOffset, width: safeWidth, height: cardStackViewHeight)
        
        playerCardViews.enumerated().forEach {
            playerCardStackView.addArrangedSubview($1)
        }
        
        playerCardStackView.addArrangedSubview(dealerCardView)
        
        self.view.layoutIfNeeded()
        
        pokerOptionView.layout()
        playerCardViews.enumerated().forEach {
            $1.layout()
        }
        dealerCardView.layout()
    }
}
