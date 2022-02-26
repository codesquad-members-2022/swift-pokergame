//
//  Card.swift
//  PokerGameApp
//
//  Created by Joobang Lee on 2022/02/25.
//

import Foundation
import QuartzCore

struct PokerCard {
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    enum Rank: Int {
        case Ace = 1
        case two, three, four, five
        case six, seven, eight, nine, ten
        case Jack, Queen, King
    }
    
    var suit: Suit
    var rank: Rank
    
    func makeCard() -> String{
        var rawValue: String
        switch rank.rawValue{
        case 1:
            rawValue = "A"
        case 11:
            rawValue = "J"
        case 12:
            rawValue = "Q"
        case 13:
            rawValue = "K"
        default :
            rawValue = "기본값"
        }
        return "\(suit.rawValue)\(rawValue)"
    }
}

