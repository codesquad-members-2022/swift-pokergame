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
        super.init(name: .Dealer)
    }
    
    func dealCard(to player:Player) throws {
        if let card = deck.removeOne() {
            player.getCard(card)
        }else{
            throw PokerGame.Errors.insufficientCard
        }
    }
    
    
}
