import Foundation

/*
 > 카드 초기화
 카드 전체를 초기화했습니다.
 총 52장의 카드가 있습니다.

 > 카드 섞기
 전체 52장의 카드를 섞었습니다.

 > 카드 하나 뽑기
 ♠️A
 총 51장의 카드가 남아있습니다.

 > 카드 하나 뽑기
 ♥️9
 총 50장의 카드가 남아있습니다.
 */

class CardDeck {
    private var deck: Array<Card> = [Card]()
    //TODO: 연산 속성은 퍼블릭으로 해도 되지 않을까? 연산 속성도 프라이빗으로 하고, 따로 메서드를 구현하면 코드 중복이 아닌가?
    // 만약 연산 속성에 값을 저장을 못한다고 하면, 코드 중복이다. 값을 저장할 수 있다면, 잘 나눈것. 결론은 코드 중복이다.
    // Error Message : Cannot assign to property: 'cardCount' is a get-only property
    public var cardCount: Int {
        return deck.count
    }
    //MARK: 처음처럼 카드 덱을 채워 넣는다(52장).
    public func reset() {
        
    }
    //MARK: 무작위로 섞는다. Array.suffle(), suffled() 사용금지
    public func shuffle() {
        
    }
    //MARK: 덱 중에 하나를 pop한다
    public func removeOne() -> Card {
        let randomInt = Int.random(in: 0..<cardCount)
        let removed = deck.remove(at: randomInt)
        print(removed.description)
        print("총 \(cardCount)장의 카드가 남았습니다.")
        return removed
    }
}
