import Foundation

class Dealer: Playable {
    private var name: String = "딜러"
    private var hand: Computer.Hands = .highCard
    private var playerDeck: [Card] = []
    
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
    
    func addCard(card: Card) {
        playerDeck.append(card)
    }
    //TODO: throws를 Result<>로 변환을 해야할 거같은데.. 인터넷에 나와있는 예제들은 비동기 함수에서 적용하는 법을 알려줘서 지금과 같은 동기 함수에서는 어떻게 적용해야할지 모르겠다. https://onelife2live.tistory.com/1 잘 정리되어있음.
    func giveCard2Player(players: [Playable], deck: CardDeck) {
        guard PokerGame.round != 7 else {
            print("카드를 모두 배분했습니다.")
            return
        }
        PokerGame.round += 1
        var playersWithDealer: [Playable] = players
        playersWithDealer.append(self)
        
        for player in playersWithDealer {
            if let removed = try? deck.removeOne().get() {
                player.addCard(card: removed)
            } else {
                print("Card is empty.")
                return
            }
        }
    }
}
