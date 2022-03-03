import Foundation

class Player: Playable {
    func addCard(card: Card) {
        playerDeck.append(card)
    }
    
    func openAllCards() -> String {
        guard playerDeck.count != 1 else {
            if let firstCard = playerDeck.first?.description {
                return "[ \(firstCard.description) ]"
            } else {
                return "There is no card"
            }
        }
        let cardsString : String = playerDeck.reduce("") {
            var tempString:String = $0.description + ", " + $1.description
            tempString.removeFirst();tempString.removeFirst()
            tempString.append("]")
            var result = "["
            result += tempString
            return result
        }
        return cardsString
    }
    
    private var name: String
    private var playerDeck: [Card] = []
    private var hand : Computer.Hands = .highCard
    
    init(name: String) {
        self.name = name
    }
}
