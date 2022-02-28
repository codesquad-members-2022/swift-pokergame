//
//  Player.swift
//  Pocker
//
//  Created by 송태환 on 2022/02/27.
//

import Foundation

/// 프로토콜로 딜러와 함께 공통화 가능한지?
class Player {
    // MARK: - Properties
    private(set) var cards = Array<Card>()
    private let name: String
    
    // MARK: - Initializer
    init(name: String) {
        self.name = name
    }
    
    // MARK: - Methods
    func receive(card: Card) {
        self.cards.append(card)
    }
}
