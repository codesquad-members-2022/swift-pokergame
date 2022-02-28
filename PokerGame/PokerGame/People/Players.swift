//
//  Players.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/28.
//

import Foundation

//Dealer의 player의 배열인 players의 의존성을 없애고 기존 Game의 프로퍼티들을 옮기기 위해 새로운 타입을 선언했습니다.
final class Players {
    
    private var players:[Player]
    private var playerCards:[[Card]]  { players.map { $0.cards  } }
    private var playerNames:[String] { players.map { $0.name   } }
    private var playerRanks:[RankOfHands] { players.map { $0.checkRankOfHand() }}
    var count: Int { players.count }                                                //게임타입과 이 값을 이용해서 딜러 Deck안에 카드가 충분한지 안한지를 판단하기 위해 선언했습니다.
    
    init(players:[Player]) {
        self.players = players
    }

    func WholeNamesAndResults() -> String {
        let playerResults = zip(self.playerNames, self.playerRanks)
        var stringResults:String = "게임결과 \n"
        
        for (name,rank) in playerResults {
            stringResults.append("이름:\(name) 결과:\(rank) \n")
        }
        
        return stringResults
    }
    
    func wholePlayerCards() -> String {
        let playerCards = zip(self.playerNames, self.playerCards)
        var stringResult:String = "카드결과 \n"
        
        for (name,cards) in playerCards {
            stringResult.append("이름:\(name) 결과:\(cards) \n")
        }
        
        return stringResult
    }
    
    
    func dealCardsForEachPlayer(deck:Deck) {
        for player in players {
            guard let card = deck.removedOne() else { return }
            player.addCard(card: card)
        }
    }
    
    func resetCards() {
        self.players.map { $0.resetCards()}
    }
    
    
    
    
}
