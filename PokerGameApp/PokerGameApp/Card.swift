//
//  Card.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/22.
//

import Foundation

struct Card {
    private let faceData: CardData.FaceData
    private let numericData: CardData.NumericData
    
    init(faceData: CardData.FaceData, numericData: CardData.NumericData) {
        self.faceData = faceData
        self.numericData = numericData
    }
}

extension Card: CustomStringConvertible {
    var description: String {
        return "\(self.faceData)\(self.numericData)"
    }
}
