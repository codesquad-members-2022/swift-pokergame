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
}

class PokerGame {
    let cardDeck = CardDeck()
    let dealer = Player(name: "딜러")
    public private(set) var players: [Player] = []
    let playType: PokerType
    
    var delegate: PokerGameDelegate?
    
    init(playType: PokerType, playerCount: Int) {
        self.playType = playType
        
        createPlayer(count: playerCount)
    }
    
    private func createPlayer(count: Int) {
        var playerNames = ["shingha", "bibi", "alex", "rosa", "chez", "ocean", "pigbag"]
        
        (0..<count).forEach { _ in
            guard let randomIndex = (0..<playerNames.count).randomElement() else {
                return
            }
            let playerName = playerNames.remove(at: randomIndex)
            self.players.append(Player(name: playerName))
        }
    }
    
    func play() {
        let distributionCount = self.playType.rawValue
        (0..<distributionCount).forEach() { _ in
            players.forEach() {
                guard let card = cardDeck.removeOne() else {
                    return
                }
                $0.add(card: card)
            }
            
            guard let card = cardDeck.removeOne() else {
                return
            }
            
            dealer.add(card: card)
        }
        
        players.enumerated().forEach { index, player in
            self.delegate?.player(index: index, player: player)
        }
        self.delegate?.dealer(dealer: self.dealer)        
    }
}


