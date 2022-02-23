//
//  Pokergame.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation
struct PokerGame {
    private var cardDeck : CardDeck = CardDeck()
    var cardDeckCount : Int {
        return cardDeck.count
    }
    var dealer : Dealer
    var players : [Player] = []
    let stud : Stud
    let playerCount : Int
    init(stud: Stud, playerCount: PlayerCount) {
        self.stud = stud
        self.dealer = Dealer(cardDeck: cardDeck)
        //playerCount에 딜러 인원 추가
        self.players.append(dealer)
        self.playerCount = playerCount.rawValue + 1
        var playerName = PlayerName()
        for _ in 0..<playerCount.rawValue {
            let name = playerName.popName()
            self.players.append(Player(name: name))
        }
    }
    mutating func play() {
        drawCard(each: self.stud.rawValue)
        while cardDeck.count != 0 {
            drawCard(each: 1)
        }
    }
    
    func drawCard(each : Int) {
        for _ in 0..<each {
            for player in players {
                guard let drawedCard = dealer.draw() else {break}
                player.getCard(card: drawedCard )
            }
        }
    }

    enum PlayerCount : Int{
        case one = 1
        case two
        case three
        case four
    }
    enum Stud : Int {
        case sevenCard = 7
        case fiveCard = 5
    }
}
