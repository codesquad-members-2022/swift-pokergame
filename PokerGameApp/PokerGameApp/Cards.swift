import Foundation

struct Cards: CustomStringConvertible{
  
    private var cards: [Card] = []
    var count: Int{
        return self.cards.count
    }
    var description: String{
        return self.cards.description
    }
    
    mutating func addCard(_ card: Card){
        self.cards.append(card)
    }
    
    mutating func removeOne()-> Card?{
        return self.cards.popLast()
    }
    
    func getIterator() -> IndexingIterator<[Card]>{
        return self.cards.makeIterator()
    }

}
