//
//  CardInfo.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/22.
//

//Card의 정보를 한번에 담아서 출력하고자 Struct를 선언하고 그안에 Suit와 Rank Enum을 넣었다.
struct Card:CustomStringConvertible {
    
    var description: String {
        return "\(suit)\(rank)"
    }
    
    //랜덤한 값으로 뽑힌 suit와 rank는 private으로 설정하여 밖에서 수정하거나 확인하지 못하게 하였다.
     var suit:String = Suit.randomSuit
     var rank:String = Rank.randomRank
    
    
    //카드의 모양(suit)를 나타내줄 Enum
    //카드의 모양은 총 네가지로 고정되어 있으므로 예외처리를 원활하게 하기 위해서 Enum으로 설정한다.
    enum Suit:String,CaseIterable {
        case spade = "♠️"
        case heart = "❤️"
        case diamond = "♦️"
        case clover = "♣️"
        
        //랜덤 값을 뽑아내는 프로퍼티, 값을 넣지않고 타입 자체에서 값을 뽑아내기 위해 Static을 사용했다.
        static var randomSuit:String {
            Suit.allCases.randomElement()?.rawValue ?? "유효한 Suit가 없습니다."
        }
    }
    
    //카드의 Rank(숫자)를 나타내줄 Enum
    //카드의 숫자는 1~13으로 일정한 값만이 들어올것이기 때문에 예외처리를 원활하게 하기 위해서 enum으로 만든다.
    enum Rank {
        
        //카드의 Rank는 2종류로 나울수있다.
        case numberType(Int)        //숫자 2,3,4,5,6,7,8,9
        case alphabetType(Int)   //알파벳 A,J,Q,K
        
        //각 숫자 1~13까지 모두 case를 주면 코드가 길어지므로 숫자와 알파벳를 나타내는 두가지 케이스에 조건을 달아서 나타내 보았다.
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
        
        //Rank는 RawValue값을 지정해주지 않아서 CaseLiterable프로토콜을 준수하지 못하기 때문에 allCase를 따로 만들어 준다.
        private static var allCases:[Card.Rank] {   //Allcase는 이 Enum안에서만 사용이 되고 밖에서는 알필요도 없기 때문에 private선언한다.
            var ranks = [Card.Rank]()
            for i in 1...13 {
                if i > 1 && 10 > i {                    //1보다 크고 10보다 작으면 숫자타입
                ranks.append(Rank.numberType(i))
                } else {                                //그외는 알파벳 타입
                ranks.append(Rank.alphabetType(i))
                }
            }
            return ranks
        }
        
        //만든 allcase를 이용해서 랜덤값을 뽑는 Static프로퍼티를 만들어본다.
        static var randomRank:String {
            Rank.allCases.randomElement()?.rank ?? "유효한 Rank가 없습니다."
        }
    }
}

