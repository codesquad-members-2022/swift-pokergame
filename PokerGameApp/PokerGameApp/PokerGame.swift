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
    private var cardStud: Int = 5 // default는 5카드 스터드
    
    
    // 게임을 실행합니다.
    mutating func run() {
        let playersCount = 4 // 플레이어는 1 ~ 4명 (Int.random(in: 1...4))
        let playerNames = makeRandomName(count: playersCount) // 참가자 이름 배열 생성
        
        // 플레이어 추가
        for name in playerNames {
            self.players.append(Player(name: name))
        }
        
        dealer = Dealer()
        dealer?.distributeCard(to: players)
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
    
    
    struct Dealer: Participant {
        var cards = CardDeck()
        
        func distributeCard(to player: [Player]) -> Int {
            return 0
        }
    }
    
    
    struct Player: Participant {
        var name: String
        var cards = CardDeck()
    }
}


protocol Participant {
    var cards: CardDeck { get set } // 딜러, 플레이어는 모두 카드 갖고 있음.
}
