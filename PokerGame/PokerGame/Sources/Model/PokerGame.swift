//
//  PokerGame.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class PokerGame {
    
    struct Action {
        var inputPokerType: (PokerType) -> Void = { _ in }
        var inputPlayerCount: (Int) -> Void = { _ in }
        var pokerStart: () -> Void = { }
    }
    
    struct State {
        var updateLayout: (PokerGame.PokerType) -> Void = { _ in }
        var didCreatePlayers: ([Player]) -> Void = { _ in }
        var didCreateDealer: (Player) -> Void = { _ in }
        var finishPoker: () -> Void = { }
    }
    
    var action = Action()
    var state = State()
    
    private var pokerType = Environment.Poker.defaultType
    private var playerCount = Environment.Player.defaultCount
        
    private var players = [Player]()
    private var dealer = Player(name: "Dealer")
    private let cardDeck = CardDeck()
    
    init() {
        action.pokerStart = start
        
        action.inputPokerType = { pokerType in
            self.pokerType = pokerType
            self.start()
        }
        
        action.inputPlayerCount = { playerCount in
            self.playerCount = playerCount
            self.start()
        }
    }
    
    private func createPlayers(count: Int) -> [Player] {
        var playerNames = ["shingha", "bibi", "alex", "rosa", "chez",
                           "ocean", "Jason", "Alex", "dale", "kai",
                           "jee", "mase", "sol", "ebony", "gucci",
                           "jed", "beck", "eddy", "selina", "pigBag"].filter { $0.count <= 5}

        return (0..<count).map { _ in
            let randomIndex = Int.random(in: 0..<playerNames.count)
            let playerName = playerNames.remove(at: randomIndex)
            return Player(name: playerName)
        }
    }
    
    private func start() {
        self.state.updateLayout(pokerType)
        
        self.players = createPlayers(count: playerCount)
        self.cardDeck.shuffle()

        for _ in 0..<pokerType.rawValue {
            for player in players {
                guard let card = cardDeck.removeOne() else {
                    self.state.finishPoker()
                    return
                }
                player.add(card: card)
            }
            guard let card = cardDeck.removeOne() else {
                self.state.finishPoker()
                return
            }
            self.dealer.add(card: card)
        }
        self.state.didCreatePlayers(players)
        self.state.didCreateDealer(dealer)
    }
}

extension PokerGame {
    enum PokerType: Int, CaseIterable {
        case fiveCard = 5
        case sevenCard = 7
    }
}
