//
//  CardInfo.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22.
//

import Foundation

struct CardInfo {
    
    let number: Card.Number!
    let symbol: Card.Symbol!

    init?(as symbol: Card.Symbol, with number: String) {
        guard let number = Int(number) else {
            debugPrint(number)
            print("number can not convert as integer.")
            return nil
        }
        self.init(as: symbol, with: number)
    }

    init?(as symbol: Card.Symbol, with number: Card.Number) {
        guard (1...13).contains(number) else {
            debugPrint(number)
            print("CardNumber should be in 1 to 13.")
            return nil
        }

        self.number = number
        self.symbol = symbol
    }
}

extension CardInfo: Equatable {
    static func == (lh: CardInfo, rh: CardInfo) -> Bool {
        return lh.number == rh.number && lh.symbol == rh.symbol
    }
}
