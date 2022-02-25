//
//  Dealer.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/24.
//

import Foundation
class Dealer : Person {
    
    //게임에서 생성된 덱은 딜러만 관리가능
    private var deck : Deck
    
    init(gameDeck : Deck) {
        self.deck = gameDeck
        super.init(name: PokerGame.Roster.Dealer.rawValue)
    }
    
    private func shuffleDeck(){
        self.deck.shuffle()
    }
    
    //딜러가 카드를 나눠주기전에 한번 덱을 섞고 나눠준다.
    func dealCard(to playerList:[Person], on mode:PokerGame.GameMode) throws {
        shuffleDeck()
        for _ in 0..<mode.rawValue {
            for player in playerList {
                if let card = deck.removeOne() {
                    player.getCard(card)
                }else{
                    throw PokerGame.Errors.InsufficientCard
                }
            }
        }
    }
    
    
}
