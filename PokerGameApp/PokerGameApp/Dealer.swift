//
//  Dealer.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/28.
//

import Foundation

class Dealer: Playable {
    var name: String = "딜러"
    var hand: Computer.Hands = .highCard
    var playerDeck: [Card] = []
    var upCards: [Card] = []
    
    func openAllCards() -> String {
        var cardsString: String = playerDeck.reduce("[ ") {
            return $0.description + "," + $1.description
        }
        cardsString.append(" ]")
        return cardsString
    }
    
    func addCard(card: Card, round: Int) {
        switch round {
        case 1,4...6:
            upCards.append(card)
            fallthrough
        default:
            playerDeck.append(card)
        }
    }
    
    func showUpCards() -> String {
        guard !upCards.isEmpty else {
            return "There is no upCard"
        }
        var cardsString: String = upCards.reduce("[ ") {
            return $0.description + "," + $1.description
        }
        cardsString.append(" ]")
        return cardsString
    }
    
    func getHand(cards: [Card], computer: Computer) {
        
    }
    func giveCard2Player(players: [Playable], deck: CardDeck) throws -> Card {
        guard PokerGame.round == 7 else {
            throw PokerGameError.roundAt7
        }
        PokerGame.round += 1
        var playersWithDealer: [Playable] = players
        playersWithDealer.append(self)
        for player in playersWithDealer {
            let removed = try deck.removeOne()
            player.addCard(card: removed, round: PokerGame.round)
        }
    }
}
