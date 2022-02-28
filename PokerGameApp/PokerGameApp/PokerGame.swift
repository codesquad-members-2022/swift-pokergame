//
//  PokerGame.swift
//  PokerGame
//
//  Created by 송태환 on 2022/02/27.
//

import Foundation

struct PokerGame {
    typealias Rule = Dealer.Rule
    
    enum GameError: Error {
        case invalidPlayerNumber
        case unexpectedTermination
    }
    
    // MARK: - Properties
    private(set) var players: [Gambler]
    private let dealer: Dealer
    private var requiredNumberOfCards: Int {
        let players = self.players.count + 1
        return players * self.dealer.rule.value
    }
    
    init(rule: Rule) {
        self.dealer = PlayerFactory.makeDealer(rule: rule)
        self.players = PlayerFactory.makePlayers()
        self.dealer.delegate = self
    }
    
    // MARK: - Private Methods
    private func handleGameResult() {
        let _ = self.determineWinner()
        // TODO: Output 을 담당하는 객체에 승자정보 전달
    }
    
    private func determineWinner() -> Player {
        // TODO: 승자 판별 로직 구현
        return self.players[0] as! Player
    }
    
    private func isValidNumberOfPlayer(count: Int) -> Bool {
        guard count > 1 else { return false }
        return (count + 1) * self.dealer.rule.value <= 52
    }
    
    // MARK: - Public Methods
    mutating func setPlayers(count: Int) throws {
        guard self.isValidNumberOfPlayer(count: count) else {
            throw Self.GameError.invalidPlayerNumber
        }
        
        if !self.players.isEmpty {
            self.players = []
        }
        
        self.players = PlayerFactory.makePlayers(count: count)
    }
    
    mutating func run() {
        self.dealer.play()
    }
}

extension PokerGame: DealerDelegate {
    func gameWillEnd() {
        self.handleGameResult()
    }
}

