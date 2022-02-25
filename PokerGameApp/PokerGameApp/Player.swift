import Foundation

class Player: CustomStringConvertible{
    private var name: String
    var currentName: String{
        return self.name
    }
    private (set) var cards: Cards
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
    
    func takeOutCard()-> Card?{
        guard let card = self.cards.removeOne() else { return nil }
        return card
    }
}
