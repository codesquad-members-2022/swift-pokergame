//
//  Dealer.swift
//  PockerGame
//
//  Created by 송태환 on 2022/02/27.
//

import Foundation

protocol DealerDelegate {
    var players: [Gambler] { get }
    func gameWillEnd()
}

final class Dealer: Player {
    // MARK: - Properties
    enum Rule {
        case fiveCardStud
        case sevenCardStud
        
        var value: Int {
            switch self {
            case .fiveCardStud:
                return 5
            case .sevenCardStud:
                return 7
            }
        }
    }
    
    private var cardDeck: CardDeck
    private var hasEmptyDeck: Bool {
        return self.cardDeck.count == 0
    }
    
    private(set) var rule: Rule
    var delegate: DealerDelegate?
    
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
        guard let players = self.delegate?.players else { return }
        
        for _ in 1...self.rule.value {
            self.drawCard(for: self)
            
            for player in players {
                self.drawCard(for: player)
            }
        }
    }
    
    private func prepare() {
        if self.hasEmptyDeck || self.shoudEndGame() {
            self.cardDeck.reset()
            self.cardDeck.shuffle()
        }
    }
    
    private func shoudEndGame() -> Bool {
        guard let players = self.delegate?.players else { return true }
        let minimumRequirement = (players.count + 1) * self.rule.value
        return minimumRequirement > self.cardDeck.count
    }
    
    private func collectCardsFromGamblers() {
        self.emptyCards()
        
        guard let players = self.delegate?.players else { return }
        
        for player in players {
            player.emptyCards()
        }
    }
    
    func setRule(rule: Rule) {
        self.rule = rule
    }
    
    func play() {
        self.prepare()
        self.distributeCards()
        self.delegate?.gameWillEnd()
        self.collectCardsFromGamblers()
        
        if !self.shoudEndGame() {
            self.play()
        }
    }
}

