//
//  Dealer.swift
//  PockerGame
//
//  Created by 송태환 on 2022/02/27.
//

import Foundation

protocol DealerDelegate {
    var players: [Gambler] { get }
    func gameEnd()
}

final class Dealer: Player {
    // MARK: - Properties
    enum Rule: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    
    private var cardDeck: CardDeck
    private var isDeckEmpty: Bool {
        return self.cardDeck.count == 0
    }
    
    var delegate: DealerDelegate?
    var rule: Rule
    
    // MARK: - Initializer
    init(deck: CardDeck, rule: Rule) {
        self.cardDeck = deck
        self.rule = rule
        super.init(name: "딜러")
    }
    
    // MARK: - Methods
    private func drawCard(for player: Gambler) {
        guard let card = self.cardDeck.removeOne() else { return }
        player.receive(card: card)
    }
    
    private func distributeCards() {
        for _ in 1...rule.rawValue {
            self.drawCard(for: self)
            for player in self.delegate?.players ?? [] {
                self.drawCard(for: player)
            }
        }
    }
    
    func play() {
        self.cardDeck.shuffle()
        self.distributeCards()
        self.delegate?.gameEnd()
    }
}

