//
//  Gambler.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

class Gambler {
    
    private let name: String
    private var cardDeck: [Card]
    
    init(name: String) {
        var name = name
        
        if !name.isAvailable() {
            name.makeAvailable()
        }
        
        self.name = name
        self.cardDeck = [Card]()
    }
    
    public func receiveCard(_ card: Card) {
        self.cardDeck.append(card)
    }
}

extension String {
    func isAvailable() -> Bool {
        let alphabetSet = CharacterSet.letters
        
        switch self.count {
            case ...1:
                return false
            case 2...5:
                return CharacterSet(charactersIn: self).isSubset(of: alphabetSet)
            default:
                let target = String(self.prefix(5))
                return CharacterSet(charactersIn: target).isSubset(of: alphabetSet)
        }
    }
    
    mutating func makeAvailable() {
        
        switch self.count {
            case 0:
                self = "JK"
            case 1:
                self = self + self
            case 2...5:
                self = "JK"
            default:
                self = String(self.prefix(5))
        }
    }
}
