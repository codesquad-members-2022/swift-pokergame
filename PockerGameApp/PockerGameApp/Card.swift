//
//  Card.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/21.
//

import Foundation

class Card {
    
    enum Number: Int, CustomStringConvertible { // 각 case별로 숫자를 각각 넣지 않고, 맨 앞의 case에 해당하는 숫자만 rawValue에 할당하면, 그 뒤의 case들은 자동으로 맨 앞 case의 rawValue에 +1된 Integer가 할당되기 때문에 enum 타입을 선택
        case ace = 1 ,two ,three ,four ,five ,six ,seven , eight, nine, ten, jack, queen, king
        
        var description: String {
            switch self.rawValue {
            case 1:
                return("A")
            case 11:
                return("J")
            case 12:
                return("Q")
            case 13:
                return("K")
            default:
                return(String(self.rawValue))
            }
        }
    }
    
    enum Symbol: Character, CustomStringConvertible { // 해당 타입에는 case별 rawValue를 갖는 것 외에 다른 메서드나 프로퍼티가 있을 필요가 없어, 가장 간단한 타입인 enum 타입을 선택
        case heart = "❤️"
        case spade = "♠️"
        case diamond = "🔷"
        case club = "♣️"
        
        var description: String {
            return String(self.rawValue)
        }
    }
    
    var number: Number
    var symbol: Symbol
    
    init(number: Number, symbol: Symbol) {
        self.number = number
        self.symbol = symbol
    }

}

extension Card: CustomStringConvertible {
    var description: String {
        return symbol.description + number.description
    }
}
