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
    var cardDeck: [Card] = []
    var upCards: [Card] = []
    
    func openAllCards() -> String {
        var cardsString: String = cardDeck.reduce("[ ") {
            return $0.description + "," + $1.description
        }
        cardsString.append(" ]")
        return cardsString
    }
    
    func addCard(card: Card, round: Int) {
        <#code#>
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
    func giveCard2Player(player: [Player]) -> Card {
        PockerGame.round
    }
}
