import Foundation

class Player: CustomStringConvertible{
    private var name: String
    var currentName: String{
        return self.name
    }
    fileprivate (set) var cards: [Card] = []
    var description: String{
        return "\(name) \(cards)"
    }
    
    init(name: String){
        self.name = name
    }
    
    func addCard(_ card: Card){
        self.cards.append(card)
    }
}

class Dealer: Player{

    init() {
        super.init(name: "딜러")
    }
    
    func distributeCards(){
        
    }
    
    func takeOutAllNecessaryCards(deck: CardDeck, count: Int)->CardDeck{
        var deckCopy = deck
        for _ in 0..<count{
            guard let card = deckCopy.removeOne() else { continue }
            super.addCard(card)
        }
        return deckCopy
    }
    
    func takeOutCard()-> Card?{
        guard let card = self.cards.popLast() else { return nil }
        return card
    }
}
