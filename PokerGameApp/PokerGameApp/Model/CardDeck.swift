import Foundation

class CardDeck {
    private var deck: Array<Card> = [Card]()
    var cardCount: Int {
        return deck.count
    }

    func reset() {
        deck.removeAll()
        let shapeSet: Set<Shape> = [.club, .diamond, .heart, .spade]
        let rankSet: Set<Rank> = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
        for shape in shapeSet {
            for rank in rankSet {
                deck.append(Card(shape: shape, rank: rank))
            }
        }
    }

    func shuffle() {
        guard !deck.isEmpty else {
            return
        }
        let count = cardCount	
        for i in 0..<count - 1 {   // 0 ~ n - 2
            let randomIndex = Int.random(in: i..<count)
            let temp = deck[i]
            deck[i] = deck[randomIndex]
            deck[randomIndex] = temp
        }
    }
    
    func removeOne()  -> Result<Card, PokerGameError> {
        guard !deck.isEmpty else {
            return Result.failure(PokerGameError.cardIsEmpty)
        }
        return .success(deck.removeFirst())
    }
}

