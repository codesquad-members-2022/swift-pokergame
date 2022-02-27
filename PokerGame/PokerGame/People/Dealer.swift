//
//  Dealer.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/25.
//

import Foundation

//딜러가 카드를 돌릴때마다 Deck안에 남아있는 card의 갯수를 추적해야하므로 class로 선언했다.
class Dealer {
    
    private var deck:Deck
    private var cards:[Card] = []
    private var players:[Player]
    private var enoughCardsInDeck:Bool = true               //카드안의 덱이 충분하지 않으면 false로 바뀝니다.
    
    var gameType:GameType                                   //한 딜러가 한가지의 게임타입만 사용할수 있는 것은 이상하다고 생각해 외부에서 값을 변경할 수 있도록 설정했습니다.
    
    init(deck:Deck, players:[Player],gameType:GameType) {
        self.deck = deck
        self.players = players
        self.gameType = gameType
    }
    
    //카드를 다 나눠주고 나면 한 게임이 끝난 것이므로 Game을 리턴하도록 해보았습니다.
    func dealTheCards() -> Game {
        self.deck.shuffle()                                  //카드를 나누어주기전에 보통 섞기때문에 shuffle함수를 실행했습니다.
            switch gameType {
            case .fiveStud:
                deal(gameType:gameType)
            case .sevenStud:
                deal(gameType:gameType)
        }
        return Game(players: self.players)
    }
    
    private func deal(gameType:GameType) {
        for _ in 0..<gameType.dealCount {
            self.getTheCard()
            for player in players {
                guard let card = deck.removedOne() else { return }
                player.getTheCard(card: card)
            }
        }
    }
    
    private func getTheCard() {
            guard let card = deck.removedOne() else { return }
            cards.append(card)
    }
}
