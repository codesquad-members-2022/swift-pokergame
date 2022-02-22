//
//  PokerGame.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

protocol PokerGameDelegate {
    func startPoker()
    func player(index: Int, player: Player)
    func dealer(dealer: Player)
}

class PokerGame {
    var delegate: PokerGameDelegate?
    public private(set) var pokerType = Environment.defaultPokerType
    public private(set) var playerCount = Environment.defaultPlayerCount
        
    func createPlayers(count: Int) -> [Player] {
        var playerNames = ["shingha", "bibi", "alex", "rosa", "chez", "ocean", "pigbag"]
        return (0..<count).map { _ in
            let randomIndex = Int.random(in: 0..<playerNames.count)
            let playerName = playerNames.remove(at: randomIndex)
            return Player(name: playerName)
        }
    }
    
    func start() {
        self.delegate?.startPoker()
        
        var players: [Player] = [Player(name: "Dealer")]
        players += createPlayers(count: playerCount)
        let cardDeck = CardDeck()
        cardDeck.shuffle()
        let cardCount = pokerType.cardCount
        
        for _ in 0..<cardCount {
            for player in players {
                guard let card = cardDeck.removeOne() else {
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

extension PokerGame: PokerOptionDelegate {
    func onPokerTypeSelected(pokerType: PokerGame.PokerType) {
        self.pokerType = pokerType
        start()
    }
    
    func onPlayerCountSelected(playerCount: Int) {
        self.playerCount = playerCount
        start()
    }
}


extension PokerGame {
    enum PokerType: CaseIterable {
        case sevenCard
        case fiveCard
    }
}

extension PokerGame.PokerType {
    var cardCount: Int {
        self == .sevenCard ? 7 : 5
    }
}
