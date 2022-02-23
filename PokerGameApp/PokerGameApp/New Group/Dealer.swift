//
//  Dealer.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/24.
//

import Foundation

class Dealer {
    private let cardDeck = CardDeck()
    private let stud: Stud
    
    init(stud: Stud) {
        self.stud = stud
    }
}
