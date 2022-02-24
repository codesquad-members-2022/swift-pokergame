//
//  Players.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/23.
//

import Foundation

class PokerPlayers {
    
    enum Constants {
        static let limitCount = 4
        static let defaultCount = 4
    }
    
    struct State {
        var givePlayerCard: (Int, Int, Card) -> Void = { _, _, _ in }
    }
    
    var state = State()
    
    private var players = [Player]()
    
    var count: Int {
        players.count
    }
    
    var names: [String] {
        players.map{ $0.name }
    }
    
    //MARK: - Card
    
    private func addCard(at index: Int, card: Card) {
        players[index].add(card: card)
    }
    
    func removeAllCard() {
        players.forEach {
            $0.removeAllCard()
        }
    }

    //MARK: - Player
    
    func addPlayer(players: [Player]) {
        players.forEach{
            addPlayer(player: $0)
        }
    }
    
    func addPlayer(player: Player) {
        self.players.append(player)
    }
    
    func removeAllPlayer() {
        self.players.removeAll()
    }
    
    func cardDistribution(dealer: Dealer, pokerStud: PokerGame.Stud, addEventHandler: @escaping (Int, Int, Card) -> Void ) {
        (0..<pokerStud.cardCount).forEach { cardIndex in
            (0..<count).forEach { index in
                guard let card = dealer.removeOne() else {
                    return
                }
                addCard(at: index, card: card)
                addEventHandler(index, cardIndex, card)
            }
        }
        
        players.forEach {
            $0.scoreCalculation()
        }
    }
    
    func getWinner() -> Player? {
        players.filter{ $0.hasScore }.sorted().last
    }
}
