//
//  Dealer.swift
//  PockerGame
//
//  Created by 송태환 on 2022/02/27.
//

import Foundation

protocol DealerDelegate {
    var players: [Player] { get }
    func draw(card: Card, for player: Player)
    func gameEnd()
}

final class Dealer: Player {
    // MARK: - Properties
    private var cardDeck: CardDeck
    var delegate: DealerDelegate?
    
    // MARK: - Initializer
    init(deck: CardDeck) {
        self.cardDeck = deck
        super.init(name: "딜러")
    }
    
    // MARK: - Methods
    func draw() {
        // 딜러가 뽑아서 플레이어별로 뽑은 카드 전달
        guard let card = self.cardDeck.removeOne() else {
            self.delegate?.gameEnd()
            return
        }
        
        // 딜러 자신의 카드
        self.receive(card: card)
        
        // 플레이어가 받을 카드를 뽑고 누구에게 전달할지는 PokerGame 에게 위임
        for player in self.delegate?.players ?? [] {
            self.delegate?.draw(card: card, for: player)
        }
    }
}
