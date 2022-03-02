//
//  Card.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/01.
//

import Foundation

class Card: CustomStringConvertible {
    // 크게 카드의 속성을 2가지로만 보았을 때 미션에서 제시한 것 처럼 '모양'과 '숫자'를 확인할 수 있었다.
    // enum으로 타입을 정의하여 자주 사용되는 property를 중첩으로 묶어서 사용하면 편리할 것 같았다.
    enum Suit{
        // 실제 포커에서 사용하는 카드의 모양만 따왔고 이모티콘에서 유니코드로 4가지의 모양만 정의하고있어
        // 데이터를 처리할 때 편리할 것 같아 사용하였다.
        enum Suitshape: String, CustomStringConvertible{
            case heart
            case clover
            case space
            case diamond
            
            var description: String {
                switch(self) {
                case .heart:
                    return "♥️"
                case .clover:
                    return "♣️"
                case .space:
                    return "♠️"
                case .diamond:
                    return "♦️"
                }
            }
            
        }
        // 카드가 가지고 있는 숫자들을 비교할 때 rawValue로 처리하면 편할 것 같았다.
        enum SuitNumber: Int, CustomStringConvertible{
            case ace
            case two
            case three
            case four
            case five
            case six
            case seven
            case eight
            case nine
            case ten
            case Jack
            case Queen
            case King
            
            var description: String {
                switch(self) {
                case .ace:
                    return "A"
                case .Jack:
                    return "J"
                case .Queen:
                    return "Q"
                case .King:
                    return "K"
                default:
                    return String(describing: self.rawValue)
                }
            }
        }
    }
    
    // 다른 객체로 인한 간섭이 있으면 안될 것 같아 let으로 선언하였습니다.
    //다른 객체는 Card 객체의 suitShape, suitCardNumber, suitSpecialCard 각각의 객체에만 접근할 수 있도록 하였습니다.
    let suitShape: Suit.Suitshape
    let suitCardNumber: Suit.SuitNumber
    
    init(suitShape: Suit.Suitshape, suitCardNumber: Suit.SuitNumber) {
        self.suitShape = suitShape
        self.suitCardNumber = suitCardNumber
    }
    
    var description: String {
        return "\(self.suitShape)\(self.suitCardNumber)"
    }
    
}

