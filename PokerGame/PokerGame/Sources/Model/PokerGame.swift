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
    
    struct Action {
        var playGame: (PokerType, Int) -> Void = { _, _ in }
    }
    
    var action = Action()
    var delegate: PokerGameDelegate?
    
    init() {
        action.playGame = playGame
    }
    
    func playGame(pokerType: PokerType, playerCount: Int) {
        let players = createPlayer(count: playerCount)
        let dealer = Player(name: "Dealer")
        play(pokerType: pokerType, players: players, dealer: dealer)
    }
    
    func createPlayer(count: Int) -> [Player] {
        var playerNames = ["shingha", "bibi", "alex", "rosa", "chez", "ocean", "pigbag"]

        return (0..<count).compactMap { _ in
            guard let randomIndex = (0..<playerNames.count).randomElement() else {
                return nil
            }
            let playerName = playerNames.remove(at: randomIndex)
            return Player(name: playerName)
        }
    }
    
    func play(pokerType: PokerType, players: [Player], dealer: Player) {
        let cardDeck = CardDeck()
        let distributionCount = pokerType.rawValue
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
        self.delegate?.dealer(dealer: dealer)
    }
}


