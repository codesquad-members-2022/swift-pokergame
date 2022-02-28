//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/25.
//

import Foundation

struct PokerGame {
    private var dealer: Dealer? // run 하면 Dealer를 지정합니다.
    private var players = [Player]() // run 하면 players를 추가해줍니다.
    private var totalCards = CardDeck() // 전체 카드
    private var receivedCard: Card? // 딜러로부터 받은 카드
    private var cardStud: Int = Stud.five.rawValue // default는 5카드 스터드
    
    
    enum Stud: Int {
        case five = 5
        case seven = 7
    }
    
    
    // 게임을 실행합니다.
    mutating func run() {
        let playersCount = Int.random(in: 1...4) // 플레이어는 1 ~ 4명 (Int.random(in: 1...4))
        let playerNames = makeRandomName(count: playersCount) // 참가자 이름 배열 생성

        // 플레이어 추가
        for name in playerNames {
            self.players.append(Player(name: name))
        }

        dealer = Dealer()
        
        var availableTurnCount = (52 / cardStud) / (playersCount + 1) // 총 가능한 턴 수
        while availableTurnCount != 0 {
            try? distribute(numberOfParticipants: playersCount + 1)  // 참여자들 (딜러, 플레이어)에게 cardStud만큼 카드 분배.\
            availableTurnCount -= 1
        }
        
        
    }
    
    
    // Participant에게 cardStud만큼 카드를 분배합니다.
    mutating func distribute(numberOfParticipants: Int) throws {
        var distributedCardCount = 0 // 한 턴에서 분배한 카드 수
        
        for _ in 0..<cardStud {
            guard let dealerCard = try? getCardOfDealer() else {
                throw PokerGameError.invalidDistributeToDealer
            }
            dealer?.cards = dealerCard
            distributedCardCount += 1
            
            for player in 0..<players.count {
                guard let cards = try? getCard(of: players[player]) else {
                    throw PokerGameError.invalidDistributeToPlayer
                }
                
                players[player].cards = cards
                distributedCardCount += 1
            }
        }
    }
    
    
    // 딜러가 전체 카드덱에서 카드를 한 장 뽑고, 그 카드를 자신의 카드 배열에 추가합니다.
    mutating func getCardOfDealer() throws -> [Card]? {
        guard let cardStatus = dealer?.remove(card: totalCards) else {
            throw PokerGameError.invalidDealer
        }
        
        guard let card = cardStatus.0 else {
            throw PokerGameError.invalidCardPicked
        }
        
        guard let totalCard = cardStatus.1 else {
            throw PokerGameError.invalidTotalCard
        }
        
        dealer?.receive(card: card) // 뽑은 카드를 자신의 배열에 추가하기
        self.totalCards = totalCard // 전체 카드덱 업데이트
        return dealer?.cards // 딜러의 카드 배열 리턴
    }
    
    
    mutating func getCard(of player: Player) throws -> [Card]? {
        var currentPlayer = player
        guard let cardStatus = dealer?.remove(card: totalCards) else {
            throw PokerGameError.invalidDealer
        }
        
        guard let card = cardStatus.0 else {
            throw PokerGameError.invalidCardPicked
        }
        
        guard let totalCard = cardStatus.1 else {
            throw PokerGameError.invalidTotalCard
        }
        
        currentPlayer.receive(card: card) // 받은 카드를 자신의 배열에 추가하기
        self.totalCards = totalCard // 전체 카드덱 업데이트
        return currentPlayer.cards // 플레이어의 카드 배열 리턴
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


extension PokerGame: CustomStringConvertible {
    var description: String {
        return "\(dealer)\n\(players)"
    }
}
