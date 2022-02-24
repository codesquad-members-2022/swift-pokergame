//
//  Player.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation
import UIKit

class Player {
    private var name : String
    private var hand : [Card] = []
    var handCount : Int {
        return hand.count
    }
    init(name: String) {
        self.name = name
    }
    func getCard(card : Card) {
        self.hand.append(card)
    }
}
