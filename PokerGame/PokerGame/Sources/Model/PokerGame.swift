//
//  PokerGame.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class PokerGame {
    
    enum Constants {
        static let defaultPokerStud = PokerGame.Stud.fiveCard
    }
    
    struct Action {
        var inputPokerStud: (Stud) -> Void = { _ in }
        var inputPlayerCount: (Int) -> Void = { _ in }
        var pokerReset: () -> Void = { }
        var pokerPlay: () -> Void = { }
    }
    
    struct State {
        var resetPokerBoard: (Stud, [String]) -> Void = { _, _ in }
        var givePlayerCard: (Int, Int, Card) -> Void = { _, _, _ in }
        var giveDealerCard: (Int, Card) -> Void = { _, _ in }
        var finishPoker: () -> Void = { }
    }
    
    var action = Action()
    var state = State()
    
    private var pokerStud = Constants.defaultPokerStud
    private var playerCount = PokerPlayers.Constants.defaultCount
    
    private let pokerPlayers = PokerPlayers()
    private var dealer = Dealer()
    
    init() {
        action.pokerReset = resetGame
        action.pokerPlay = play
        
        action.inputPokerStud = { pokerStud in
            self.pokerStud = pokerStud
            self.state.resetPokerBoard(self.pokerStud, self.pokerPlayers.names)
        }
        
        action.inputPlayerCount = { playerCount in
            self.playerCount = playerCount
            self.pokerPlayers.set(players: self.createPlayers(count: playerCount))
            self.state.resetPokerBoard(self.pokerStud, self.pokerPlayers.names)
        }
    }
    
    func resetGame() {
        dealer.cardReset()
        pokerPlayers.set(players: createPlayers(count: playerCount))
        state.resetPokerBoard(pokerStud, pokerPlayers.names)
    }
    
    private func play() {
        pokerPlayers.removeAllCard()
        dealer.removeAllCard()
        dealer.cardShuffle()
        
        if dealer.cardCount < (pokerPlayers.count + 1) * pokerStud.cardCount {
            self.state.finishPoker()
            return
        }
        
        (0..<pokerStud.cardCount).forEach { cardIndex in
            (0..<pokerPlayers.count).forEach { index in
                guard let card = dealer.removeOne() else {
                    return
                }
                pokerPlayers.addCard(at: index, card: card)
                state.givePlayerCard(index, cardIndex, card)
            }
            
            guard let card = dealer.removeOne() else {
                return
            }
            dealer.add(card: card)
            state.giveDealerCard(cardIndex, card)
        }
    }
    
    private func createPlayers(count: Int) -> [PokerPlayer] {
        var nameData = ["shingha", "bibi", "alex", "rosa", "chez",
                           "ocean", "Jason", "Alex", "dale", "kai",
                           "jee", "mase", "sol", "ebony", "gucci",
                           "jed", "beck", "eddy", "selina", "pigBag"]
        
        var players = [PokerPlayer]()
        while players.count != count {
            let randomIndex = Int.random(in: 0..<nameData.count)
            let name = nameData.remove(at: randomIndex)
            if name.count < 2 || name.count > 5 {
                continue
            }
            players.append(PokerPlayer(name: name))
        }
        return players
    }
}

extension PokerGame {
    enum Stud: CaseIterable {
        case sevenCard
        case fiveCard
        
        var cardCount: Int {
            switch self{
            case .sevenCard: return 7
            case .fiveCard: return 5
            }
        }
    }
}
