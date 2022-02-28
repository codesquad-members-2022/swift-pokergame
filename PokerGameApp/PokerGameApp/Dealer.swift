import Foundation

class Dealer: Player{
    
    private var deck: CardDeck
    
    init(deck: CardDeck) {
        self.deck = deck
        super.init(name: "딜러")
    }
    
    func takeOutCard()-> Card?{
        guard let card = self.deck.removeOne() else { return nil }
        return card
    }
}
