//
//  Person.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/24.
//

import Foundation
//딜러와 플레이어의 상위 클래스
class Person {
    
    private var name : PokerGame.Roster
    //XCTest 하기 위해 외부에서 읽기만 가능하고 내부에서만 수정이 가능하도록  private (set) 설정.
    private(set) var cards = [Card]()

    init(name: PokerGame.Roster) {
        self.name = name
    }
    
    func recieveCard(_ card :Card){
        self.cards.append(card)
    }
    
    func resetCards() {
        self.cards.removeAll()
    }
}

extension Person : CustomStringConvertible {
    var description: String {
        return "\(self.name) \(self.cards)"
    }
}



