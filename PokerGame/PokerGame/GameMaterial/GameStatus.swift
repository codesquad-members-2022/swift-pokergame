//
//  GameStatus.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/28.
//

enum GameStatus {
    case successed(() -> String)
    case error
    
    var status:String {
        switch self {
        case .successed(let result):
            return result()
        case .error:
            return "오류:더 이상 나누어줄 카드가 없습니다."
        }
    }
    
}
