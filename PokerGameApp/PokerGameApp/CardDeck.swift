import Foundation

struct CardDeck{
    
    private var deck: [Card] = []
    private (set) var count: Int = 0
    
    init(){
        reset()
    }
    
    mutating func shuffle(){
        for i in 0..<deck.count-1{
            let randomIndex = Int.random(in: i..<deck.count)
            let temp = deck[i]
            deck[i] = deck[randomIndex]
            deck[randomIndex] = temp
        }
    }
    
    mutating func removeOne()-> Card{
        count -= 1
        return deck.removeLast()
    }
    
    mutating func reset(){
        self.deck = []
        for suit in Card.Suit.allCases{
            for number in Card.Number.allCases{
                guard let card = Card(suit: suit, number: number) else{ continue }
                self.deck.append(card)
            }
        }
        self.count = self.deck.count
    }
}
