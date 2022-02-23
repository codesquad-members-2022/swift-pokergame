//
//  Player.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation
import UIKit

struct Player {
    var name : String
    private var hand : [Card] = []
    
    init(name: String) {
        self.name = name
    }
    mutating func getCard(card : Card) {
        self.hand.append(card)
    }
}
