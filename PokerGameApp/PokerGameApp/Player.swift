//
//  Player.swift
//  Pocker
//
//  Created by 송태환 on 2022/02/27.
//

import Foundation

class Player {
    // MARK: - Properties
    let name: String
    var cards = Array<Card>()
    
    // MARK: - Initializer
    init(name: String) {
        self.name = name
    }
    
    // MARK: - Methods
    func receive(card: Card) {
        self.cards.append(card)
    }
}
