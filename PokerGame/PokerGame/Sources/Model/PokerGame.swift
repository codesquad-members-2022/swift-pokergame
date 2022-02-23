//
//  PokerGame.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class PokerGame {
    
    enum Constants {
        static let defaultType = PokerGame.PokerType.fiveCard
    }
    
    struct Action {
        var inputPokerType: (PokerType) -> Void = { _ in }
        var inputPlayerCount: (Int) -> Void = { _ in }
        var pokerReset: () -> Void = { }
        var pokerPlay: () -> Void = { }
    }
    
    struct State {
        var updateUi: ([String]) -> Void = { _ in }
        var givePlayerCard: (Int, Int, Card) -> Void = { _, _, _ in }
        var giveDealerCard: (Int, Card) -> Void = { _, _ in }
        var finishPoker: () -> Void = { }
    }
    
    var action = Action()
    var state = State()
    
    private var pokerType = Constants.defaultType
    private var playerCount = PokerPlayers.Constants.defaultCount
        
    private var pokerPlayers = PokerPlayers()
    private let cardDeck = CardDeck()
    
    init() {
        action.pokerReset = resetGame
        action.pokerPlay = play
        
        action.inputPokerType = { pokerType in
            self.pokerType = pokerType
        }
        
        action.inputPlayerCount = { playerCount in
            self.playerCount = playerCount
        }
    }
    
    func resetGame() {
        self.pokerPlayers.createPlayers(count: playerCount)
        self.state.updateUi(self.pokerPlayers.players.map { $0.name })
        self.cardDeck.reset()
    }
    
    private func play() {
        pokerPlayers.removeAllCard()
        self.cardDeck.shuffle()
        
        if cardDeck.count < pokerPlayers.count * pokerType.cardCount {
            self.state.finishPoker()
            return
        }
        
        (0..<pokerType.cardCount).forEach { cardIndex in
            (0..<pokerPlayers.count).forEach { index in
                guard let card = cardDeck.removeOne() else {
                    return
                }
                if index < pokerPlayers.players.count {
                    pokerPlayers.players[index].add(card: card)
                    self.state.givePlayerCard(index, cardIndex, card)
                } else {
                    pokerPlayers.dealer.add(card: card)
                    self.state.giveDealerCard(cardIndex, card)
                }
            }
        }
    }
}

extension PokerGame {
    enum PokerType: CaseIterable {
        case fiveCard
        case sevenCard
        
        var cardCount: Int {
            switch self{
            case .sevenCard: return 7
            case .fiveCard: return 5
            }
        }
    }
}
