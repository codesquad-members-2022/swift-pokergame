//
//  PokerGame.swift
//  PokerGame
//
//  Created by 송태환 on 2022/02/27.
//

import Foundation

struct PokerGame: DealerDelegate {
    enum Rule: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }

    // MARK: - Properties
    private let dealer: Dealer
    private(set) var players: [Player] = []
    private var rule: Rule
    
    init(rule: Rule) {
        let deck = CardDeckFactory.create()
        self.dealer = Dealer(deck: deck)
        self.rule = rule
    }
    
    // MARK: - Methods
    private func playByFiveCardStud() {}
    
    private func playBySevenCardStud() {}
    
    mutating func setPlayers(names: [String]) {
        if !self.players.isEmpty {
            self.players = []
        }
        
        for name in names {
            self.players.append(Player(name: name))
        }
    }
    
    mutating func setRule(to rule: Rule) {
        self.rule = rule
    }
    
    mutating func play(by rule: Self.Rule) {
        if self.players.isEmpty {
            self.setPlayers(names: ["JK", "Honux", "Cron", "Ivy"])
        }
        
        switch rule {
        case .fiveCardStud:
            return
        case .sevenCardStud:
            return
        }
    
    }
    
    // MARK: - Delegate Methods
    func draw(card: Card, for player: Player) {
        player.receive(card: card)
    }
    
    func gameEnd() {
        // 더 뽑을 카드가 없음을 노티
    }
}
