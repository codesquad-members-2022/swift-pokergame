//
//  Person.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/24.
//

import Foundation

class Person {
    
    private var name : Names
    private var cards = [Card]()

    init(name: Names) {
        self.name = name
    }
    
    func getCard(_ card :Card){
        self.cards.append(card)
    }
    
}

extension Person : CustomStringConvertible {
    var description: String {
        return "\(self.name) \(self.cards[..<cards.count])"
    }
}


enum Names : String,CaseIterable {
    case Kai
    case Tim
    case Luan
    case Hana
    case Dealer
}
