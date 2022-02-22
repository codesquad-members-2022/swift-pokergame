import Foundation

class Card: CustomStringConvertible{
    
    /*
     카드 모양은 4가지만 존재하기 때문에 열거형으로 각 케이스를 선언했습니다.
     굳이 클래스나 구조체로 만들 필요 없이 각 케이스별로 일정한 문자열값을 보여주면 된다고 생각했습니다.
     */
    internal enum Suit: CustomStringConvertible, CaseIterable{
        case clover
        case diamond
        case club
        case heart
        
        var description: String{
            switch self {
            case .clover:
                return "♣︎"
            case .diamond:
                return "♦︎"
            case .club:
                return "♠︎"
            case .heart:
                return "♥︎"
            }
        }
    }
    
    /*
     카드 숫자는 실제 숫자와 출력을 위한 문자의 두 가지 속성을 가진 구조체로 선언했습니다.
     실제 정수타입의 숫자값과 출력을 위한 문자열값을 모두 가지고 있어야 한다고 생각했고,
     열거형으로 13가지의 케이스를 모두 선언하기 보다는 구조체의 description 프로퍼티값을 switch를 통해 각기 다른 값을 가지도록 하는 것이 더 효율적이라고 생각했습니다.
     */
    internal struct Number: CustomStringConvertible{
        var number: Int
        var description: String{
            switch number{
            case 11:
                return "A"
            case 12:
                return "Q"
            case 13:
                return "K"
            default:
                return String(number)
            }
        }
        
        init(_ number: Int){
            self.number = number
        }
    }
    
    let suit: Suit
    let number: Number
    var description: String{
        return "\(suit)\(number)"
    }
    
    init?(suit: Suit, number: Number){
        self.suit = suit
        self.number = number
    }
}
