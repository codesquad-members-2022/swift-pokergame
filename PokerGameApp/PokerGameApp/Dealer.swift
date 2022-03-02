import Foundation

class Dealer: Playable {
    var name: String = "딜러"
    var hand: Computer.Hands = .highCard
    var playerDeck: [Card] = []
    var upCards: [Card] = []
    
    func openAllCards() -> String {
        var cardsString: String = playerDeck.reduce("[ ") {
            return $0.description + "," + $1.description
        }
        cardsString.append(" ]")
        return cardsString
    }
    
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
        var cardsString: String = upCards.reduce("[ ") {
            return $0.description + "," + $1.description
        }
        cardsString.append(" ]")
        return cardsString
    }

    //TODO: throws를 Result<>로 변환을 해야할 거같은데.. 인터넷에 나와있는 예제들은 비동기 함수에서 적용하는 법을 알려줘서 지금과 같은 동기 함수에서는 어떻게 적용해야할지 모르겠다.
    func giveCard2Player(players: [Playable], deck: CardDeck) {
        guard PokerGame.round == 7 else {
            print("카드를 모두 배분했습니다.")
            return
        }
        PokerGame.round += 1
        var playersWithDealer: [Playable] = players
        playersWithDealer.append(self)
        
        for player in playersWithDealer {
            if let removed = try? deck.removeOne().get() {
                player.addCard(card: removed, round: PokerGame.round)
            } else {
             print("Card is empty.")
            }
        }
    }
}
