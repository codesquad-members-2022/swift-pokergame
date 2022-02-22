//
//  String+Extension.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22.
//

import Foundation

extension String {
    var convertCardNumber: CardNumber? {
        guard let number = Int(self) else { return nil }
        return CardNumber.allRange.contains(number as CardNumber) ? number as CardNumber : nil
    }
}
