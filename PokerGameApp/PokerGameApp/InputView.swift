//
//  InputView.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/24.
//

import Foundation

struct InputView {
    static func readGameInfo() -> [String] {
        print("카드게임 방식와 인원 수를 입력하세요.")
        let input = readLine() ?? ""
        return input.split(separator: " ").map { String($0) }
    }
}


struct CardGame {
    var players = [String]()
    var cardCount: Int
    
    
    // 게임을 실행합니다. 
    mutating func run() {
        let input = InputView.readGameInfo()
        
        guard input.count == 2 else {
            print("입력이 잘못되었습니다.")
            return
        }
        
        self.cardCount = Int(input[0]) ?? 0
        
        let playersCount = Int(input[1]) ?? 0
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
