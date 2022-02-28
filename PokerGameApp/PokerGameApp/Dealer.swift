//
//  Dealer.swift
//  PockerGame
//
//  Created by 송태환 on 2022/02/27.
//

import Foundation

/// 딜리게이트 패턴 추가학습할 것
protocol DealerDelegate {
    /// 본인이 관리할 필요가 없는 속성, 메서드 위임
    var players: [Player] { get }
    func distribute(card: Card, for player: Player)
    func gameEnd()
}

final class Dealer: Player {
    // MARK: - Properties
    private var cardDeck: CardDeck
    private var isDeckEmpty: Bool {
        return self.cardDeck.count == 0
    }
    
    var delegate: DealerDelegate?
    
    // MARK: - Initializer
    init(deck: CardDeck) {
        self.cardDeck = deck
        super.init(name: "딜러")
    }
    
    // MARK: - Methods
    private func drawCard(for player: Player) {
        guard let card = self.cardDeck.removeOne() else {
            self.delegate?.gameEnd()
            return
        }
            
        player.receive(card: card)
    }
    
    func draw() {
        self.drawCard(for: self)
        
        // 플레이어가 받을 카드를 뽑고 누구에게 전달할지는 PokerGame 에게 위임
        for player in self.delegate?.players ?? [] {
            guard let card = self.cardDeck.removeOne() else {
                break
            }
            
            self.delegate?.distribute(card: card, for: player)
        }
    }
}
