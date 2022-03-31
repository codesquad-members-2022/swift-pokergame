import Foundation

class PokerGame {

    enum Games: Int {
        case sevenCardStud = 7
        case fiveCardStud = 5
    }
    enum PlayerCount: Int {
        case one = 1, two, three, four
    }
    
    private var round: Int = 0
    
    private var cardDeck = CardDeck()
    private var sortOfGame: Games
    var playerCount: PlayerCount // 딜러를 제외한 숫자 예) playerCount 가 2면, 카드게임에 참여하는 주체는 총 3명
    private(set) var players: [Participant] = []
    private(set) var dealer: Dealer = Dealer()
    private var nameArray: [String] = ["HK", "JK", "Crong", "Honux", "Chloe", "Ivy", "Gucci"]
    let computer = Computer()
    
    init(sortOfGame: Games, playerCount: PlayerCount) {
        self.sortOfGame = sortOfGame
        self.playerCount = playerCount
        for _ in 0..<playerCount.rawValue {
            self.players.append(Player(name: self.nameArray.remove(at: Int.random(in: 0..<self.nameArray.count))))
        }
        players.append(dealer)
    }
    
    func play() {
        cardDeck.reset()
        cardDeck.shuffle()
        for _ in 0..<self.sortOfGame.rawValue {
            giveCard2Player()
        }
    }

    func informResult(_ computer: Computer) -> String {
        var result: String = ""
        for player in players {
            result += "\(player.intruduceYourSelf()) = \(printSomeoneCards(player: player)) [\(player.computeMyHand(computer))]"
            result += "\n"
        }
        return result
    }
    
    private func printSomeoneCards(player: Participant) -> String {
        let deck = player.playerDeck
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
    
    private func giveCard2Player() {
        round += 1
        for player in players {
            if let selectedCard = try? cardDeck.removeOne().get() {
                player.addCard(card: selectedCard)
            } else {
                print("Card is empty.")
                return
            }
        }
    }
}

extension PokerGame {
    func pickWinner(_ playerList : [Participant], _ computer : Computer ) -> Participant {
        var playerAndHand: [Participant : Hand] = [:]
        for player in playerList {
            let hand = player.computeMyHand(computer)
            playerAndHand.updateValue(hand, forKey: player)
        }
        
        let firstKey = Array(playerAndHand.keys)[0]
        let firstValue = firstKey.computeMyHand(computer)
        var winner : (player: Participant, hand: Hand) = (firstKey,firstValue)
        for (player, hand) in playerAndHand {
            if winner.hand < hand {
                winner = (player,hand)
            }
        }

        return winner.player
    }
}
