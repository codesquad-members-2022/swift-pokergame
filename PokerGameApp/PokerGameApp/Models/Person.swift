//
//  Person.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/24.
//

import Foundation
//딜러와 플레이어의 상위 클래스
class Person {
    
    private var name : String
    private var cards = [Card]()

    init(name: String) {
        self.name = name
    }
    
    func getCard(_ card :Card){
        self.cards.append(card)
    }
    
    func resetCards() {
        self.cards.removeAll()
    }
}

extension Person : CustomStringConvertible {
    var description: String {
        return "\(self.name) \(self.cards[..<cards.count])"
    }
}



