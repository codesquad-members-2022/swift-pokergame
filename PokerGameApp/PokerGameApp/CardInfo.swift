//
//  CardInfo.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22.
//

import Foundation

/*
 CardInfo를 Card 클래스와 따로 나눈 이유는
 Card 클래스가 Card의 행동만을 정의하고 CardInfo는 데이터 역할만을 하도록 하기 위함입니다.
 */
struct CardInfo {
    
    // 초기화 시 지정하고 나서 바꿀 일은 없지만 참조할 필요는 있을 것 같아서
    // 접근제한자를 private(set)으로 제한하였습니다.
    private(set) var number: CardNumber!
    private(set) var symbol: CardSymbol!
    
    init(as symbol: CardSymbol, with number: CardNumber) {
        self.number = number
        self.symbol = symbol
    }
    
    // String일 경우 CardNumber가 아니라면 nil 반환하는 init을 따로 생성합니다.
    init?(as symbol: CardSymbol, with number: String) {
        guard let number = number.convertCardNumber else { return nil }
        self.number = number
        self.symbol = symbol
    }
}

// 카드가 같은지 비교하는 방법은 info가 같은지 비교하면 되기 때문에
// CardInfo 타입에 Equatable 프로토콜을 구현하도록 코딩하였습니다.
extension CardInfo: Equatable {
    static func == (lh: CardInfo, rh: CardInfo) -> Bool {
        return lh.number == rh.number && lh.symbol == rh.symbol
    }
}
