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
    // [수정] private(set) var... 과 let... 의 역할이 차이가 미미하다는 코멘트를 주셔서 생각해보니 그런 것 같습니다.
    // [수정] CardInfo 객체의 프로퍼티를 수정할 생각은 아직도 없지만, 정 수정해야할 일이 생긴다면 구조를 바꾸거나 let을 private(set)으로 변경하겠습니다.
    let number: Card.Number!
    let symbol: Card.Symbol!

    // String일 경우 CardNumber가 아니라면 nil 반환하는 init을 따로 생성합니다.
    // [수정] String으로 넘어온 number 파라미터가 Int로 변환되지 않으면 debugPrint로 콘솔에 메시지를 호출하고 nil을 반환하도록 수정합니다.
    init?(as symbol: Card.Symbol, with number: String) {
        guard let number = Int(number) else {
            debugPrint(number)
            print("number can not convert as integer.")
            return nil
        }
        self.init(as: symbol, with: number)
    }

    // [수정] Card에 포함되어야 할 CardNumber의 범위를 넘어서게 될 경우는 debugPrint로 콘솔에 메시지를 호출하고 nil을 반환하도록 수정합니다.
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

// 카드가 같은지 비교하는 방법은 info가 같은지 비교하면 되기 때문에
// CardInfo 타입에 Equatable 프로토콜을 구현하도록 코딩하였습니다.
extension CardInfo: Equatable {
    static func == (lh: CardInfo, rh: CardInfo) -> Bool {
        return lh.number == rh.number && lh.symbol == rh.symbol
    }
}
