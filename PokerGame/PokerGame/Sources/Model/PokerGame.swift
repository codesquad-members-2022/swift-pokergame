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
        var pokerResult: (Int, Score) -> Void = { _, _ in }
        var finishPoker: () -> Void = { }
    }
    
    var action = Action()
    var state = State()
    
    private var pokerStud = Constants.defaultPokerStud
    private var playerCount = PokerPlayers.Constants.defaultCount
    
    private let pokerPlayers = PokerPlayers()
    private var dealer = Dealer()
    
    init() {
        action.pokerPlay = play
        
        action.pokerReset = {
            self.resetGame()
            self.dealer.cardReset()
        }
        
        action.inputPlayerCount = { playerCount in
            self.playerCount = playerCount
            self.resetGame()
        }
        
        action.inputPokerStud = { pokerStud in
            self.pokerStud = pokerStud
            self.state.resetPokerBoard(self.pokerStud, self.pokerPlayers.names)
        }
    }
    
    func resetGame() {
        pokerPlayers.removeAllPlayer()
        pokerPlayers.addPlayer(players: self.makeNewPlayers(count: playerCount))
        pokerPlayers.addPlayer(player: dealer)
        state.resetPokerBoard(pokerStud, pokerPlayers.names)
    }
    
    private func play() {
        pokerPlayers.removeAllCard()
        dealer.cardShuffle()
        
        if dealer.hasRemainCardCount(stud: pokerStud, playerCount: pokerPlayers.count) == false {
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
        }
        
        pokerPlayers.getHighScore()
//        if let highScorePlayer = pokerPlayers.highScorePlayer() {
//            print("\(highScorePlayer)")
//        }
    }
    
    private func makeNewPlayers(count: Int) -> [Player] {
        var nameData = ["shingha", "bibi", "alex", "rosa", "chez",
                           "ocean", "Jason", "Alex", "dale", "kai",
                           "jee", "mase", "sol", "ebony", "gucci",
                           "jed", "beck", "eddy", "selina", "pigBag"]
        
        var players = [Player]()
        while players.count != count {
            let randomIndex = Int.random(in: 0..<nameData.count)
            let name = nameData.remove(at: randomIndex)
            if name.count < 2 || name.count > 5 {
                continue
            }
            players.append(Player(name: name))
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
