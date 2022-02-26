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
        var changeValue: String
        switch rank.rawValue{
        case 1:
            changeValue = "A"
        case 11:
            changeValue = "J"
        case 12:
            changeValue = "Q"
        case 13:
            changeValue = "K"
        default :
            changeValue = "기본값"
        }
        return "\(suit.rawValue)\(changeValue)"
    }
}

