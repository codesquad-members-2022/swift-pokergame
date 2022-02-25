import Foundation

class Dealer: Player{
    
    init() {
        super.init(name: "딜러")
    }
    
    func takeOutAllNecessaryCards(deck: CardDeck, count: Int)->CardDeck{
        var deckCopy = deck
        for _ in 0..<count{
            guard let card = deckCopy.removeOne() else { continue }
            super.addCard(card)
        }
        return deckCopy
    }
}
