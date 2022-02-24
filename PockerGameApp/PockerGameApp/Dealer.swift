//
//  Dealer.swift
//  PockerGameApp
//
//  Created by 김동준 on 2022/02/24.
//

import Foundation

class Dealer: Player{
    
    private var cardDeck = CardDeck()
    
    init(){
        super.init(name: "딜러")
    }

    func giveCardToPlayer() -> PockerCard?{
        switch cardDeck.removeOne(){
        case .success(let card):
            return card
        case .failure(let error):
            return nil
        }
    }
}
