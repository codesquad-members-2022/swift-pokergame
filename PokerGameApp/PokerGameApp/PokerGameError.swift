//
//  PokerError.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/28.
//

import Foundation

enum PokerGameError: Error {
    case invalidDistributeToDealer
    case invalidDistributeToPlayer
    case invalidCardRemoved
    case invalidCardDeck
}
