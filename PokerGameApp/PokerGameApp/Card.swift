//
//  Card.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22 19:00 시작.
//

import Foundation

class Card {
    
    // CardNumber는 정수로 표현하는 것이 루프 작업을 생각했을 때 효율적이라고 생각했습니다.
    // 해당 타입으로 정의된 정수를 처리하는 여러 작업들을 타입 확장으로 해결하면 더 효율적이라고도 판단하였습니다.
    // [수정] 
    typealias Number = Int
    
    private(set) var info: CardInfo

    init(using info: CardInfo) {
        self.info = info
    }
}

