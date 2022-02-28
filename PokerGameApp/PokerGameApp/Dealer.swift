import Foundation

class Dealer: Player{
    
    private var deck: CardDeck
    
    init(deck: CardDeck) {
        self.deck = deck
        super.init(name: "딜러")
    }
    
    func takeOutAllNecessaryCards(count: Int){
  
        for _ in 0..<count{
            guard let card = self.deck.removeOne() else { continue }
            super.addCard(card)
        }
    }
}
