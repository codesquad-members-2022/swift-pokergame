//
//  GameStatus.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/28.
//

enum GameStatus {
    case successedCase(() -> String)
    case errorCase
    
    var status:String {
        switch self {
        case .successedCase(let result):
            return result()
        case .errorCase:
            return "오류:더 이상 나누어줄 카드가 없습니다."
        }
    }
    
}
