//
//  Card.swift
//  Pocker Game
//
//  Created by 송태환 on 2022/02/24.
//

import Foundation

struct OutputView {
    static func printCard(card: Card) -> String {
        return "\(card.getSuit()) \(card.getRank())"
    }
}

class Card {
    
    /** Enum 을 선택해 Suit, Rank 를 선언한 이유는 다음과 같습니다.
     Class 를 사용해 Suite, Rank 를 정의한다면 Card 인스턴스 생성 시, Heap 영역에 Card, Suite, Rank 인스턴스가 각각 저장되어 공간을 차지하게 됩니다.
     반면, Enum 을 사용한다면 Card 인스턴스만 Heap 영역에 저장되고 해당 인스턴스는 Suit, Rank 정보가 값타입으로 저장됩니다.
     이러한 방식의 장점은 메모리 단편화 현상을 최소화할 수 있고 강한 참조 순환을 미연에 방지할 수 있습니다.
     뿐만아니라 클래스로 구현했을 때 보다도 적은 코드량을 유지할 수 있습니다.
     구조체 역시 같은 값타입으로써 좋은 대안일 수 있으나, Suit와 Rank 가 제한된 범위의 데이터를 표현하는 역할을 한다는 점에서 Enum 이 적합하다고 판단했습니다.
     */
    enum Suit: Int {
        case clover = 1
        case diamond
        case heart
        case spade
    }
    
    enum Rank: Int {
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
        case jack
        case queen
        case king
        
    }
    
    private let suit: Suit
    private let rank: Rank

    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    func getSuit() -> Suit {
        return self.suit
    }
    
    func getRank() -> Rank {
        return self.rank
    }
    
}

extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        if lhs.rank == lhs.rank {
            return lhs.suit < rhs.suit
        }
        
        return lhs.rank < rhs.rank
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit && lhs.rank == rhs.rank
    }
}

extension Card.Suit: Comparable, CustomStringConvertible {
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    /** Suit Enum 의 원시값 타입을 String 으로 하지 않은 이유
     문자열의 경우 Swift 에서는 값타입이지만 내부적으로는  storage 가 Objective-C 의 클래스로 되어 있어 Heap 영역에 저장됩니다.
     따라서 Enum 의 원시값을 문자열로 저장한다면 Enum 역시 값타입이지만 결과적으로 Reference Semantic 방식으로 동작할 것이라고 생각해
     메모리 관리 측면에서 문자열 데이터가 필요한 경우에만 계산 속성으로 생성해 사용하는 방식이 효율적이라고 생각합니다.
     */
    var description: String {
        switch self {
        case .heart:
            return "❤️"
        case .clover:
            return "🍀"
        case .diamond:
            return "♦️"
        case .spade:
            return "♠️"
        }
    }
}

extension Card.Rank: Comparable, CustomStringConvertible {
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    var description: String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return String(self.rawValue)
        }
    }
}
