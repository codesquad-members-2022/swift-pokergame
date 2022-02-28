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
    private(set) var players: [Gambler]
    private let dealer: Dealer
    
    init(rule: Rule) {
        self.dealer = PlayerFactory.makeDealer(rule: rule)
        self.players = PlayerFactory.makePlayers()
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
    
    mutating func setRule(rule: Rule) {
        self.dealer.rule = rule
    }
    
    mutating func run() {
        self.dealer.play()
    }
}

extension PokerGame: DealerDelegate {
    func gameEnd() {
        self.determineWinner()
    }
}

