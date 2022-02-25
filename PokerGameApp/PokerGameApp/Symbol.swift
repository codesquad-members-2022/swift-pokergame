//
//  Symbol.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/25.
//

import Foundation

class Symbol {
    let symbolInt: SymbolInt
    let symbolString: SymbolString
    
    init(_ symbolInt: SymbolInt) {
        self.symbolInt = symbolInt
        switch symbolInt {
        case .ace:
            self.symbolString = .ace
        case .two:
            self.symbolString = .two
        case .three:
            self.symbolString = .three
        case .four:
            self.symbolString = .four
        case .five:
            self.symbolString = .five
        case .six:
            self.symbolString = .six
        case .seven:
            self.symbolString = .seven
        case .eight:
            self.symbolString = .eight
        case .nine:
            self.symbolString = .nine
        case .ten:
            self.symbolString = .ten
        case .jack:
            self.symbolString = .jack
        case .queen:
            self.symbolString = .queen
        case .king:
            self.symbolString = .king
        }
    }
}

enum SymbolString: String {
    case ace = "A"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "J"
    case queen = "Q"
    case king = "K"
}

enum SymbolInt: Int, CaseIterable {
    case ace = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case jack = 11
    case queen = 12
    case king = 13

}

extension Symbol: CustomStringConvertible {
    var description: String {
        return self.symbolString.rawValue
    }
    
    
}
