//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/25.
//

import Foundation

class PokerGame {
    
    private let dealer: Dealer
    private let playerGroup: Array<Player>
    private var names: [String]
    private let playerNum: Int
    private let cardStud = 7
    
    init(playerNames: [String]) {
        self.dealer = Dealer()
        self.names = playerNames
        self.playerNum = names.count
        var playerGroup = Array<Player>()
        for name in playerNames {
            playerGroup.append(Player(name: name))
        }
        self.playerGroup = playerGroup
    }
    
    func setCards() {
        while dealer.getDeckCount() > playerNum {
            for player in playerGroup {
                guard let card = dealer.popCardFromDeck() else {
                    return
                }
                player.addCard(card)
            }
            if let card = dealer.popCardFromDeck() {
                dealer.addCard(card)
            }
            if dealer.getCardsCount() == cardStud { return }
        }
    }
    
    func printStatus() {
        print("게임 시작")
        dealer.printDeck()
        dealer.printCards()
        for player in playerGroup {
            player.printCards()
        }
        print("게임 끝")
    }
}
