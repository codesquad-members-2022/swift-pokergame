import Foundation

class PokerGame {

    enum Games: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
    }
    enum PlayerCount: Int {
        case one = 1, two, three, four
    }
    static var round: Int = 0
    
    private var cardDeck = CardDeck()
    private var sortOfGame: Games
    private var playerCount: PlayerCount // 딜러를 제외한 숫자
    private var players: [Player] = []
    private var dealer: Dealer = Dealer()
    private var computer: Computer = Computer()
    private var nameArray: [String] = ["HK", "JK", "Crong", "Honux", "Chloe", "Ivy", "Gucci"]
    
    init(sortOfGame: Games, playerCount: PlayerCount) {
        self.sortOfGame = sortOfGame
        self.playerCount = playerCount
        for _ in 0..<playerCount.rawValue {
            self.players.append(Player(name: self.nameArray.remove(at: Int.random(in: 0..<self.nameArray.count))))            }
    }
    
    func play() {
        cardDeck.reset()
        cardDeck.shuffle()
        for _ in 0..<self.sortOfGame.rawValue {
            giveCard2Player()
        }
    }

    func open() {
        var playersWtihDealer: [Playable] = players
        playersWtihDealer.append(dealer)
        for player in playersWtihDealer {
            print("\(player.intruduceYourSelf()) = \(printSomeoneCards(player: player))")
        }
    }
    
    func printSomeoneCards(player: Playable) -> String {
        let deck = player.openAllCards()
        var deckString: String {
            var result: String = "["
            for card in deck {
                result += card.description
                result += ", "
            }
            result.removeLast(); result.removeLast()
            result.append("]")
            return result
        }
        return deckString
    }
    //TODO: throws를 Result<>로 변환을 해야할 거같은데.. 인터넷에 나와있는 예제들은 비동기 함수에서 적용하는 법을 알려줘서 지금과 같은 동기 함수에서는 어떻게 적용해야할지 모르겠다. https://onelife2live.tistory.com/1 잘 정리되어있음.
    func giveCard2Player() {
        guard PokerGame.round != 7 else {
            print("카드를 모두 배분했습니다.")
            return
        }
        PokerGame.round += 1
        var playersWithDealer: [Playable] = players
        playersWithDealer.append(dealer)
        
        for player in playersWithDealer {
            if let removed = try? cardDeck.removeOne().get() {
                player.addCard(card: removed)
            } else {
                print("Card is empty.")
                return
            }
        }
    }
}
