//
//  Dealer.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/24.
//

import Foundation
class Dealer : Person {
    
    init() {
        super.init(name: PokerGame.Roster.Dealer)
    }
    
    func shuffleDeck(_ deck: Deck){
        deck.shuffle()
    }
    
    //딜러가 카드를 플레이어에게 한장 준다.
    func dealCard(to player:Person , from deck : Deck) throws {
        if let card = deck.removeOne() {
            player.recieveCard(card)
        }else{
            throw PokerGame.Errors.InsufficientCard
        }
    }
    
    
    
}
