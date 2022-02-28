//
//  Dealer.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/25.
//

import Foundation

//딜러가 카드를 돌릴때마다 Deck안에 남아있는 card의 갯수를 추적해야하므로 class로 선언했다.
final class Dealer {
    
    private var deck:Deck
    private var cards:[Card] = []
    
    var gameType:GameType                                   //한 딜러가 한가지의 게임타입만 사용할수 있는 것은 이상하다고 생각해 외부에서 값을 변경할 수 있도록 설정했습니다.
    
    init(deck:Deck,gameType:GameType) {
        self.deck = deck
        self.gameType = gameType
    }
    
    func dealTheCards(players:Players) -> Bool{
        self.deck.shuffle()                                  //카드를 나누어주기전에 보통 섞기때문에 shuffle함수를 실행했습니다.
            switch gameType {
            case .fiveStud:
                deal(players: players, gameType: .fiveStud)
                return isDeckEnough(players: players, gameType: gameType)
            case .sevenStud:
                deal(players: players, gameType: .sevenStud)
                return isDeckEnough(players: players, gameType: gameType)
        }
    }
    
    private func isDeckEnough(players:Players, gameType:GameType) -> Bool{
        switch gameType {
        case .fiveStud:
            return deck.count - players.count * 5 > 0
        case .sevenStud:
            return deck.count - players.count * 7 > 0
        }
    }
    
    
    private func deal(players:Players,gameType:GameType) {
        players.resetCards()                                    //카드를 돌리기 전에 플레이어들의 카드를 리셋시킵니다.
        for _ in 0..<gameType.dealCount { 
            self.getTheCard()                                   //딜러 한장 받고
            players.dealCardsForEachPlayer(deck: deck)          //플레이어들에게 한장씩 deck에서 카드를 줍니다.
        }
    }
    
    private func getTheCard() {
            guard let card = deck.removedOne() else { return }
            cards.append(card)
    }
}
