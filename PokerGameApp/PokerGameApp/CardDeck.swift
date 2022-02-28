import Foundation

class CardDeck{
    
    private var deck: [Card] = []
    var count: Int{
        return deck.count
    }
    
    init(){
        reset()
    }
    
    func shuffle(){
        for startIndex in 0..<deck.count-1{
            let randomIndex = Int.random(in: startIndex..<deck.count)
            let temp = deck[startIndex]
            deck[startIndex] = deck[randomIndex]
            deck[randomIndex] = temp
        }
    }
    
    func removeOne()-> Card?{
        return deck.popLast()
    }
    
    func reset(){
        self.deck = []
        for suit in Card.Suit.allCases{
            for number in Card.Number.allCases{
                let card = Card(suit: suit, number: number)
                self.deck.append(card)
            }
        }
    }
}

extension CardDeck:Equatable{
    static func == (lhs: CardDeck, rhs: CardDeck)->Bool{
        return lhs.deck == rhs.deck
    }
}
