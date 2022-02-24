//
//  Players.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/23.
//

import Foundation

class PokerPlayers {
    
    enum Constants {
        static let defaultCount: PokerPlayers.Count = .two
    }
    
    private var players = [Player]()
    
    var count: PokerPlayers.Count {
        PokerPlayers.Count.allCases[players.count - 1]
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
            (0..<count.value).forEach { index in
                guard let card = dealer.removeOne() else {
                    return
                }
                addCard(at: index, card: card)
                addEventHandler(index, cardIndex, card)
            }
        }
    }
    
    func scoreCalculation() {
        players.forEach {
            $0.scoreCalculation()
        }
    }
    
    func getWinner() -> Player? {
        players.filter{ $0.hasScore }.sorted().last
    }
}

extension PokerPlayers {
    enum Count: Int, CaseIterable {
        case one = 1, two, three, four, five, max
        
        var value: Int {
            self.rawValue
        }
        
        var index: Int {
            return self.rawValue - 1
        }
    }
}
