import Foundation

struct CardDeck{
    
    private var deck: [Card] = []
    var count: Int{
        return deck.count
    }
    
    init(){
        reset()
    }
    
    mutating func shuffle(){
        for startIndex in 0..<deck.count-1{
            let randomIndex = Int.random(in: startIndex..<deck.count)
            let temp = deck[startIndex]
            deck[startIndex] = deck[randomIndex]
            deck[randomIndex] = temp
        }
    }
    
    mutating func removeOne()-> Card{
        return deck.removeLast()
    }
    
    mutating func reset(){
        self.deck = []
        for suit in Card.Suit.allCases{
            for number in Card.Number.allCases{
                let card = Card(suit: suit, number: number)
                self.deck.append(card)
            }
        }
    }
}
