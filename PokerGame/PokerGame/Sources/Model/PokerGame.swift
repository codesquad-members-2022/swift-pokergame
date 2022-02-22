//
//  PokerGame.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

protocol PokerGameDelegate {
    func player(index: Int, player: Player)
    func dealer(dealer: Player)
    func emptyCardDeck()
}

class PokerGame {
    
    var delegate: PokerGameDelegate?
    
    func createPlayers(count: Int) -> [Player] {
        var playerNames = ["shingha", "bibi", "alex", "rosa", "chez", "ocean", "pigbag"]
        return (0..<count).map { _ in
            let randomIndex = Int.random(in: 0..<playerNames.count)
            let playerName = playerNames.remove(at: randomIndex)
            return Player(name: playerName)
        }
    }
    
    func start(pokerType: PokerType, playerCount: Int) {
        var players: [Player] = [Player(name: "Dealer")]
        players += createPlayers(count: playerCount)
        let cardDeck = CardDeck()
        cardDeck.shuffle()
        let cardCount = pokerType.rawValue
        
        for _ in 0..<cardCount {
            for player in players {
                guard let card = cardDeck.removeOne() else {
                    self.delegate?.emptyCardDeck()
                    return
                }
                player.add(card: card)
            }
        }
        
        (1..<players.count).forEach {
            self.delegate?.player(index: $0 - 1, player: players[$0])
        }
        self.delegate?.dealer(dealer: players[0])
    }
}

extension PokerGame {
    enum PokerType: Int, CaseIterable {
        case sevenCard = 7
        case fiveCard = 5
    }
}
