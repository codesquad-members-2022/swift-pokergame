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
    private var hand : Cards
    var handCount : Int {
        return hand.count
    }
    
    init(name: String) {
        self.name = name
        self.hand = Cards()
    }
    
    func receiveCard(card : Card) {
        self.hand.add(card: card)
    }
    
}
