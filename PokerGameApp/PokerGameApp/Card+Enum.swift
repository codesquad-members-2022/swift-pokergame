//
//  Card+Enum.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22.
//

import Foundation

// Symbol은 카드의 공통된 요소이기 때문에 타입으로 생성하는 것이 관리가 쉬울 것 같다고 판단하였습니다.
enum CardSymbol: String, CaseIterable {
    case spade = "♠️"
    case clover = "♣️"
    case heart = "♥️"
    case diamond = "♦️"
    
    static var randomElement: CardSymbol {
        allCases.randomElement()!
    }
}
