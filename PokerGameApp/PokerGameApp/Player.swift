import Foundation

class Player: Playable {
    func addCard(card: Card) {
        playerDeck.append(card)
    }
    
    func openAllCards() -> [Card] {
        return playerDeck
    }
    
    func intruduceYourSelf() -> String {
        return "\(self.name)"
    }
    
    private let name: String
    private var playerDeck: [Card] = []
    private var hand : Computer.Hands = .highCard
    
    init(name: String) {
        self.name = name
    }
}
