import Foundation

class Card: CustomStringConvertible{

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

    internal enum Number:String, CustomStringConvertible, CaseIterable{
        
        case ace = "A"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case jump = "J"
        case queen = "Q"
        case king = "K"
        
        var description: String{
            return self.rawValue
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
