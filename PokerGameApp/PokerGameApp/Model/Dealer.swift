import Foundation

class Dealer: Playable {
    private let name: String = "딜러"
    private var hand: Computer.Hands = .highCard
    private var playerDeck: [Card] = []
    
    func openAllCards() -> [Card] {
        return playerDeck
    }
    
    func addCard(card: Card) {
        playerDeck.append(card)
    }
    
    func intruduceYourSelf() -> String {
        return "\(self.name)"
    }
}
