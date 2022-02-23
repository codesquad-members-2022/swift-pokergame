//
//  CardInfo.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/22.
//

/*
 
 1. 자주 호출되는 하위 구조에서는 최대한 단순하게 만들자. (복잡하면 이해하기도 힘들고 컴퓨터가 일하기도 힘들다.)
 2. CustomStringConvertible를 이용해서 출력할때 효율적으로 코드를 짜보자
 3. 타입 생성과 출력을 명확히 구분해보자.
 
 */

//Card의 정보를 한번에 담아서 출력하고자 Struct를 선언하고 그안에 Suit와 Rank Enum을 넣었다.
struct Card:CustomStringConvertible {
    
    var description: String {
        return "\(suit)\(rank)"
    }
    
    //Deck을 만드는 메서드.
    //Deck클래스의 init에서 선언하기에 코드가 길어져서 하나의 함수로 묶어보았다.
    static func makeDeck() -> [Card] {
        var deck:[Card] = [Card]()
        for suit in Card.Suit.allCases {                                                    //문양 별로 1...13까지 숫자를 넣습니다.
            let suitForAllRank = Card.Rank.allCases.map { Card(suit: suit, rank: $0) }      //문양이 가질수 있는 모든 Rank를 포함하고 있기 때문에 suitForAllRank라고 지었습니다.
            deck.append(contentsOf: suitForAllRank)
        }
        return deck
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
