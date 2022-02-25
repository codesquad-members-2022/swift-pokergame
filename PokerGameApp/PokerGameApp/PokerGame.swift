//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/25.
//

import Foundation

struct PokerGame {
    private var players = [String]()
    private var cardStud: Int = 0
    
    
    // 게임을 실행합니다.
    mutating func run() {
        self.cardStud = 7
        let playersCount = 4
        self.players = makeRandomName(count: playersCount)
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
