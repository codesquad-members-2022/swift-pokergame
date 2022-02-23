//
//  CardInfo.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/22.
//

/*
 Card Class와 CardInfo Struct를 하나로 합쳤습니다.
 Card Class를 따로 만든이유는 후에 카드의 뒤집힘 유무와 같은 게임적 요소를 추가하게 하기 위해서였으나,
 생각해보니 추가하더라도 CardInfo내용과 겹치는 부분이 상당수 생길 것같고, Card라는 Struct안에
 변수명을 지정해서 만들어도 이상하지 않을 것 같아 두 데이터구조를 합쳤습니다.

 Card안에 suit와 rank 프로퍼티를 이용해 카드의 값을 명시하여 생성하는 경우 원하는 값의 카드를 만들도록 설정해보았습니다.
 또한, CasLiterable을 이용해 Card를 생성시 아무런 값을 주지 않을 경우 랜덤으로 값을 설정하게 하여 생성되는 옵션을 만들어 보았습니다.

 */

//Card의 정보를 한번에 담아서 출력하고자 Struct를 선언하고 그안에 Suit와 Rank Enum을 넣었다.
struct Card:CustomStringConvertible {
    
    var description: String {
        return "\(suit)\(rank)"
    }
    
    //생성할때 값을 넣지 않으면 초기값으로 랜덤한 값을 가지도록 하기 위해 선언했다.
    var suit:Suit = Suit.initSuit
    var rank:Rank = Rank.initRank
    
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
        
        
        //랜덤 값을 뽑아내는 프로퍼티, 생성할때 값을 넣지 않으면 랜덤으로 값을 가지도록 하기 위해 선언했다.
        static var initSuit:Card.Suit {
            Suit.allCases.randomElement() ?? .heart
        }
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
        static var initRank:Rank {
            Rank.allCases.randomElement() ?? .king
        }
    }
}
