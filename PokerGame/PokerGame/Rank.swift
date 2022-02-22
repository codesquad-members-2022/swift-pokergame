//
//  Rank.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/22.
//

import Foundation

//카드의 Rank(숫자)를 나타내줄 Enum
//카드의 숫자는 1~13으로 일정한 값만이 들어올것이기 때문에 예외처리를 원활하게 하기 위해서 enum으로 만든다.
enum Rank {
    
    //카드의 Rank는 2종류로 나울수있다.
    case numberType(Int)        //숫자 2,3,4,5,6,7,8,9
    case alphabetType(Int)   //알파벳 A,J,Q,K
    
    //각 숫자 1~13까지 모두 case를 주면 코드가 길어지므로 숫자와 기호를 나타내는 두가지 케이스에 조건을 달아서 나타내 보았다.
    var rank:String {
        switch self {
        case .numberType(let number): return String(number)
        case .alphabetType(let alphabet) where alphabet == 1: return "A"
        case .alphabetType(let alphabet) where alphabet == 11: return "J"
        case .alphabetType(let alphabet) where alphabet == 12: return "Q"
        case .alphabetType(let alphabet) where alphabet == 13: return "K"
        default: return "유효하지 않은 숫자입니다 1~13사이의 숫자를 입력해주세요"
        }
    }
}
