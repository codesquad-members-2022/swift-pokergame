//
//  PokerGame.swift
//  PokerGame
//
//  Created by 송태환 on 2022/02/27.
//

import Foundation

struct PokerGame {
    enum Rule: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }

    // MARK: - Properties
    private(set) var players: [Player] = []
    private let dealer: Dealer
    private var rule: Rule
    
    init(rule: Rule) {
        let deck = CardDeckFactory.create()
        self.dealer = Dealer(deck: deck)
        self.rule = rule
        self.dealer.delegate = self
        
    }
    
    // MARK: - Private Methods
    private func determineWinner() {
        
    }
    
    // MARK: - Public Methods
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
    
    mutating func run(by rule: Self.Rule) {
        if self.players.isEmpty {
            self.setPlayers(names: ["JK", "Honux", "Cron", "Ivy"])
        }
        
        let round = self.rule.rawValue
        
        for _ in 1...round {
            self.dealer.draw()
            
            for player in self.players {
                self.dealer.draw()
            }
        }
        
        self.determineWinner()
    }
}

extension PokerGame: DealerDelegate {
    func distribute(card: Card, for player: Player) {
        player.receive(card: card)
    }
    
    func gameEnd() {
        // 더 뽑을 카드가 없음을 노티
    }
}
