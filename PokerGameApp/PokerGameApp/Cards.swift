import Foundation

struct Cards{
    
    private var cards: [Card] = []
    var currentCards: [Card]{
        return self.cards
    }
    
    mutating func addCard(_ card: Card){
        self.cards.append(card)
    }
    
    mutating func removeCard()-> Card?{
        return self.cards.popLast()
    }
}
