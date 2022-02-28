//
//  Player.swift
//  Pocker
//
//  Created by 송태환 on 2022/02/27.
//

import Foundation

protocol Gambler {
    var cards: Array<Card> { get }
    func receive(card: Card)
}

class Player: Gambler {
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
