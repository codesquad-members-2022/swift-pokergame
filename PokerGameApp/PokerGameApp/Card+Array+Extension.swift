//
//  Card+Array+Extension.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/22.
//

import Foundation

/*
 1. reduce 같은 고차원 함수는 코드 자체가 길어져서 나눌 수 있다면 따로 나누어 놓는 것을 선호합니다.
 2. 기능을 정의할 수 있는 변수를 사용하면 코드 자체가 더 읽기 좋도록 처리해 줄 수 있습니다.
 */
extension Array where Element == Card {
    var readAll: String {
        self.reduce("") { partialResult, card in
            partialResult + " " + card.read
        }
    }
}
