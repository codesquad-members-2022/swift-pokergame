//
//  CardInfo.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/22.
//

//Card의 정보를 한번에 담아서 출력하고자 Struct를 선언하고 그안에 Suit와 Rank Enum을 넣었다.
struct Card:CustomStringConvertible,Equatable{
    
    var description: String {
        return "\(suit)\(rank)"
    }
    
    var suit:Suit
    var rank:Rank

    
    //카드의 모양(suit)를 나타내줄 Enum
    //카드의 모양은 총 네가지로 고정되어 있으므로 예외처리를 원활하게 하기 위해서 Enum으로 설정한다.
    enum Suit:String,CaseIterable,CustomStringConvertible {
        
        //description을 이용해서 값을 리턴해보자.
        var description: String {
            return "\(self.rawValue)"
        }
        
        case spade = "♠️"
        case heart = "❤️"
        case diamond = "♦️"
        case clover = "♣️"
        
    }
    
    //카드의 Rank(숫자)를 나타내줄 Enum
    //카드의 숫자는 1~13으로 일정한 값만이 들어올것이기 때문에 예외처리를 원활하게 하기 위해서 enum으로 만든다.
    enum Rank:Int,CaseIterable,CustomStringConvertible {
        var description: String {
            return "\(rank)"
        }
        
        //.numberType(1234)와 같은 값을 애초에 입력하지 못하도록 case를 만들었다.
        case ace = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case Jack
        case Queen
        case king
        
        //숫자를 표시할 것들은 default로 묶고 나머지 알파벳 카드들은 case처리를 하여 코드를 줄여보았다.
        var rank:String {
            switch self {
            case .ace: return "A"
            case .Jack: return "J"
            case .Queen: return "Q"
            case .king: return "K"
            default: return String(self.rawValue)
            }
        }
    }
}
