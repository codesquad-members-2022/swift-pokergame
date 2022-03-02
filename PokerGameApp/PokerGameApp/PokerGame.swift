//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/25.
//

import Foundation

class PokerGame: CustomStringConvertible {
    var description: String {
        return "\(dealer)\n\(playerList)"
    }
    
    private var dealer: Dealer = Dealer()
    private var player: Player?
    private var playerList = [Player]() // run 하면 players를 추가해줍니다.
    private var totalCards = CardDeck() // 전체 카드
    var cardStud: Int = Stud.five.rawValue // default는 5카드 스터드
    var playersCount: Int = Int.random(in: 1...4) // 플레이어는 1 ~ 4명 (Int.random(in: 1...4))

    private enum Stud: Int {
        case five = 5
        case seven = 7
    }


    // 게임을 실행하고, 남은 카드 수를 리턴합니다.
    func run() -> Int {
        let playerNames = makeRandomName(count: playersCount) // 참가자 이름 배열 생성

        // 플레이어 추가
        for name in playerNames {
            self.playerList.append(Player(name: name))
        }
        
        var availableTurnCount = (52 / cardStud) / (playersCount + 1) // 총 가능한 턴 수
        while availableTurnCount != 0 {
            try? distribute(numberOfParticipants: playersCount + 1)  // 참여자들 (딜러, 플레이어)에게 cardStud만큼 카드 분배.\
            availableTurnCount -= 1
        }


        return totalCards.count
    }


    // Participant에게 cardStud만큼 카드를 분배합니다.
    private func distribute(numberOfParticipants: Int) throws {
        var distributedCardCount = 0 // 한 턴에서 분배한 카드 수

        for _ in 0..<cardStud {
            guard ((try? getCardOfDealer()) != nil) else {
                throw PokerGameError.invalidDistributeToDealer
            }
            distributedCardCount += 1

            for player in playerList {
                guard ((try? getCard(of: player)) != nil) else {
                    throw PokerGameError.invalidDistributeToPlayer
                }
                distributedCardCount += 1
            }
        }
    }


    // 딜러가 전체 카드덱에서 카드를 한 장 뽑고, 그 카드를 자신의 카드 배열에 추가한 후에 전체 카드덱 리턴.
    private func getCardOfDealer() throws -> CardDeck {
        guard let card = dealer.remove(card: totalCards) else {
            throw PokerGameError.invalidCardRemoved
        }
        dealer.receive(card: card) // 뽑은 카드를 자신의 배열에 추가하기
        
        guard let cardDeck = dealer.returnCardDeck(to: totalCards) else {
            throw PokerGameError.invalidCardDeck
        }
        self.totalCards = cardDeck // 전체 카드덱 업데이트
        return cardDeck
    }


    private func getCard(of player: Player) throws -> CardDeck {
        let currentPlayer = player
        
        guard let card = dealer.remove(card: totalCards) else {
            throw PokerGameError.invalidCardRemoved
        }
        currentPlayer.receive(card: card)
        
        guard let cardDeck = dealer.returnCardDeck(to: totalCards) else {
            throw PokerGameError.invalidCardDeck
        }
        self.totalCards = cardDeck
        return cardDeck
    }


    // 플레이어의 이름을 랜덤으로 생성합니다.
    func makeRandomName(count: Int) -> [String] {
        var players = [String]()
        var alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvxwyz")
        for _ in 0..<count {
            var playerName = ""
            let characterCount = Int.random(in: 2...5) // 이름은 2~5글자 이내

            for _ in 0..<characterCount {
                playerName.append(alphabet.remove(at: Int.random(in: 0..<alphabet.count)))
            }
            players.append(playerName)
        }
        return players
    }
}
