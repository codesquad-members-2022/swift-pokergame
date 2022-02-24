//
//  Players.swift
//  PockerGameApp
//
//  Created by 김동준 on 2022/02/24.
//

import Foundation
import UIKit

struct Players{
    static let playerNames: [String] = ["ebony","eddy","gucci","chez"]
    private var players: [Player] = []
    var number: Int{
        return players.count
    }
    
    var playersCardCountSum: Int{
        var answer = 0
        for i in 0 ..< number{
            answer += players[i].playerCardCount
        }
        return answer
    }
    
    init(numbers: PockerGame.PlayerNumber){
        for i in 0 ..< numbers.playerNumber{
            players.append(Player(name: Players.playerNames[i]))
        }
    }
    
    func takeCard(index: Int, card: PockerCard){
        players[index].takeCard(card: card)
    }
    
}
