//
//  Card.swift
//  PokerGameApp
//
//  Created by Bumgeun Song on 2022/02/21.
//

import Foundation

struct Card: CustomStringConvertible {
    var suit: CardSuit
    var number: Int? {
        didSet { if !(1...13).contains(number!) { number = nil }}
    }
    
    var description: String {
        var suitString = ""
        switch suit {
        case .spades: suitString = "♠️"
        case .clubs: suitString = "♣️"
        case .hearts: suitString = "♥️"
        case .diamonds: suitString = "♦️"
        }
        
        var numberString = ""
        switch number {
        case 1: numberString = "A"
        case 11: numberString = "J"
        case 12: numberString = "K"
        case 13: numberString = "Q"
        default: numberString = "\(number!)"
        }
        
        return suitString + numberString
    }
}

enum CardSuit {
    case spades
    case clubs
    case hearts
    case diamonds
}

