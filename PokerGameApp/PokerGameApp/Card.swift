//
//  Card.swift
//  PokerGameApp
//
//  Created by 최예주 on 2022/02/22.
//

import Foundation


class Card: CustomStringConvertible{
    
    // 카드 모양은 한정되어 있으므로 enum으로 구현
    enum Symbol: String, CustomStringConvertible {
        case heart
        case diamond
        case club
        case spade
        
        var description: String {
            switch(self){
            case .heart :
                return "♥️"
            case .diamond :
                return "♦️"
            case .club :
                return "♣️"
            case .spade :
                return "♠️"
            }
        }
    }
    
    // Card의 rank는 한정되어있고, 후에 카드 랭크를 비교할때는 rawValue로 처리를 해주면
    // 편할것 같아 enum으로 구현.
    enum Rank: Int, CustomStringConvertible {
        case A = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case J
        case Q
        case K
        
        var description: String {
            switch(self){
            case .A :
                return "A"
            case .J :
                return "J"
            case .Q :
                return "Q"
            case .K :
                return "K"
            default :
                return String(describing: self.rawValue)
            }
        }
    }
     

    let symbol: Symbol
    let number: Rank
    
    init(symbol: Symbol, rank: Rank){
        self.symbol = symbol
        self.number = rank
    }
    

    var description: String {
        return "\(self.symbol)\(self.number)"
    }
}
