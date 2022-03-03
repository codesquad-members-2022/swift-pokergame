//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/25.
//

import Foundation

class PokerGame {
    
    enum Stud: Int{
        case seven = 7
        case five = 5
    }
    
    private let dealer: Dealer
    private let playerGroup: Array<Player>
    private var names: [String]
    private let playerNum: Int
    private let cardStud7 = Stud.seven.rawValue
    private let cardStud5 = Stud.five.rawValue
    
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
    
    func setCard(stud: Stud) {
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
            if dealer.getCardsCount() == stud.rawValue { return }
            
        }
    }
    
    func getDealerCardsNum() -> Int {
        return dealer.getCardsCount()
    }
    
    func getPlayersCardsNum() -> [Int] {
        return playerGroup.map{ $0.getCardsCount()}
    }
}
