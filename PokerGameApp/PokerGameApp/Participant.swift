//
//  Participant.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/28.
//

import Foundation

protocol Participant {
    var cards: [Card] { get set }
    
    mutating func receive(card: Card)
}
