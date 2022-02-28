import Foundation

class Player: CustomStringConvertible{
    private var name: String
    var currentName: String{
        return self.name
    }
    private var cards: Cards
    var cardsCount: Int{
        return self.cards.count
    }
    var description: String{
        return "\(name) \(cards)"
    }
    
    init(name: String){
        self.name = name
        self.cards = Cards()
    }
    
    func addCard(_ card: Card){
        self.cards.addCard(card)
    }
    
    func getCardsIterator() -> IndexingIterator<[Card]>{
        return self.cards.getIterator()
    }

}
