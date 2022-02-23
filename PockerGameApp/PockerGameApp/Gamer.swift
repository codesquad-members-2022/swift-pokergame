//
//  Gamer.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

protocol Gamer {
    var cardDeck: CardDeck {get set}
    mutating func getCard(_ card: Card)
}
