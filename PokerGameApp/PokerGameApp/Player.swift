import Foundation

class Player: Playable {
    func addCard(card: Card, round: Int) {
        switch round {
        case 1,4...6:
            upCards.append(card)
            fallthrough
        default:
            playerDeck.append(card)
        }
    }
    
    func showUpCards() -> String {
        guard !upCards.isEmpty else {
            return "There is no upCard"
        }
        guard playerDeck.count != 1 else {
            if let firstCard = playerDeck.first?.description {
                return "[ \(firstCard.description) ]"
            } else {
                return "There is no card"
            }
        }
        var cardsString: String = upCards.reduce("[ ") {
            return $0.description + "," + $1.description
        }
        cardsString.append(" ]")
        return cardsString
    }
    
    func openAllCards() -> String {
        guard playerDeck.count != 1 else {
            if let firstCard = playerDeck.first?.description {
                return "[ \(firstCard.description) ]"
            } else {
                return "There is no card"
            }
        }
        var cardsString : String = playerDeck.reduce("") { return $0.description + ", " + $1.description}
        cardsString.removeFirst(); cardsString.removeFirst()
        cardsString.append("]")
        var result: String = "["
        result += cardsString
        return result
    }
//    func getHand(computer: Computer) {
//        <#code#>
//    }
    
    var name: String
    var playerDeck: [Card] = []
    var upCards: [Card] = []
    var hand: Computer.Hands = .highCard
    
    init(name: String) {
        self.name = name
    }
}
