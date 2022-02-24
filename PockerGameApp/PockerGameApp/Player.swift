//
//  Player.swift
//  PockerGameApp
//
//  Created by 김동준 on 2022/02/24.
//

import Foundation

class Player{
    private let name: String
    private var cards: [PockerCard] = []
    var playerCardCount: Int{
        return cards.count
    }
    
    init(name: String){
        self.name = name
    }
    
    func receiveCard(card: PockerCard){
        self.cards.append(card)
    }
}

extension Player: CustomStringConvertible{
    var description: String {
        return "\(name) \(cards)"
    }
}
