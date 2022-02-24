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
        let alphabetSet = CharacterSet.letters
        var newName = ""
        if name.count > 5 {
            newName = String(Array(name)[0...4])
        } else if name.count < 2 {
            newName = name
            while newName.count < 2 {
                newName += name
            }
        } else {
            newName = name
        }
        if CharacterSet(charactersIn: newName).isSubset(of: alphabetSet) {
            self.name = newName
        } else {
            self.name = "JK"
        }
    
        self.cardDeck = [Card]()
    }
    
    public func receiveCard(_ card: Card) {
        self.cardDeck.append(card)
    }
}
