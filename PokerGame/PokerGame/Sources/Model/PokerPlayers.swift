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
    
    private var players = [Player]()
    
    var count: Int {
        players.count
    }
    
    var names: [String] {
        players.map{ $0.name }
    }
    
    //MARK: - Card
    
    func addCard(at index: Int, card: Card) {
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
    
    func getHighScore(){
        let score = players.enumerated().compactMap { index, player -> (Int, Score)? in
            guard let score = player.score else {
                return nil
            }
            return (index, score)
        }.sorted(by: { lhs, rhs in
            if lhs.1.rule == rhs.1.rule {
                return lhs.1.highNumber > rhs.1.highNumber
            }
            return lhs.1.rule > rhs.1.rule
        })
        
        print(score)
    }
}
