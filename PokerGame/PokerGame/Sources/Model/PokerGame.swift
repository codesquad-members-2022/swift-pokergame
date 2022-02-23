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
    
    private let pokerPlayers = PokerPlayers()
    private var dealer = Dealer()
    
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
        dealer.cardReset()
        pokerPlayers.createPlayers(names: getNames(count: playerCount))
        state.updateUi(pokerPlayers.playerNames)
    }
    
    private func play() {
        pokerPlayers.removeAllCard()
        dealer.removeAllCard()
        dealer.cardShuffle()
        
        if dealer.cardCount < (pokerPlayers.count + 1) * pokerType.cardCount {
            self.state.finishPoker()
            return
        }
        
        (0..<pokerType.cardCount).forEach { cardIndex in
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
    
    private func getNames(count: Int) -> [String] {
        var nameData = ["shingha", "bibi", "alex", "rosa", "chez",
                           "ocean", "Jason", "Alex", "dale", "kai",
                           "jee", "mase", "sol", "ebony", "gucci",
                           "jed", "beck", "eddy", "selina", "pigBag"]
        
        var playerNames = [String]()
        while playerNames.count != count {
            let randomIndex = Int.random(in: 0..<nameData.count)
            let name = nameData.remove(at: randomIndex)
            if name.count < 2 || name.count > 5 {
                continue
            }
            playerNames.append(name)
        }
        return playerNames
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
