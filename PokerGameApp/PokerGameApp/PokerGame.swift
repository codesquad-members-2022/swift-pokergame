//
//  PokerGame.swift
//  PokerGame
//
//  Created by 송태환 on 2022/02/27.
//

import Foundation

struct PokerGame {
    typealias Rule = Dealer.Rule
    // MARK: - Properties
    private(set) var players: [Player]
    private let dealer: Dealer
    private var rule: Rule
    
    init(rule: Rule) {
        self.dealer = PlayerFactory.makeDealer()
        self.players = PlayerFactory.makePlayers()
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
        
        self.players = PlayerFactory.makePlayers(names: names)
    }
    
    mutating func setRule(to rule: Rule) {
        self.rule = rule
    }
    
    mutating func run() {
        self.dealer.play(by: self.rule)
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
