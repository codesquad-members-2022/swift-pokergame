import Foundation

class CardDeck {
    private var deck: Array<Card> = [Card]()
    var cardCount: Int {
        return deck.count
    }

    func reset() -> [Card] {
        deck.removeAll()
        let shapeSet: Set<Card.Shape> = [.club, .diamond, .heart, .spade]
        let rankSet: Set<Card.Rank> = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
        for shape in shapeSet {
            for rank in rankSet {
                deck.append(Card(shape: shape, rank: rank))
            }
        }
        return deck
    }

    func shuffle() -> [Card] {
        guard !deck.isEmpty else {
            self.deck = reset()
            return shuffle()
        }
        let count = cardCount
        for i in 0..<count - 1 {   // 0 ~ n - 2
            let randomIndex = Int.random(in: i..<count)
            let temp = deck[i]
            deck[i] = deck[randomIndex]
            deck[randomIndex] = temp
        }
        return deck
    }
    
    func removeOne() -> Card {
        guard !deck.isEmpty else {
            self.deck = reset()
            return removeOne()
        }
        return deck.removeFirst()
    }
}

