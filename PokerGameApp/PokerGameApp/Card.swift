//
//  Card.swift
//  PokerGameApp
//
//  Created by 최예주 on 2022/02/22.
//

import Foundation


class Card{
    
    // 카드 모양은 한정되어 있으므로 enum으로 구현
    enum symbol: String {
        case heart = "♥️"
        case diamond = "♦️"
        case club = "♣️"
        case spade = "♠️"
    }
    
    // Card의 rank는 한정되어있고, 카드를 생성할때
    enum rank: Int {
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
            case .A : return "A"
            case .J : return "J"
            case .Q : return "Q"
            case .K : return "K"
            default : return String(describing: self.rawValue)
            }
        }
     }
    
    
    let symbol: symbol
    let number: rank
    
    init(symbol: symbol, rank: rank){
        
        self.symbol = symbol
        self.number = rank
        
        
    }
    
    func getCardInfo() -> String {
        
        return "\(self.symbol.rawValue)\(self.number.description)"
        
    }
    
    
    
    
    
    
    
}
