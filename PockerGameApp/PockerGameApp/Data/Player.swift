//
//  Player.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/23.
//

import Foundation

struct Player{
    let name: String
    private var cards: [Card] = []
    
    // 딜러가 주는 카드를 받을 때 사용되는 함수
    mutating func receiveCard(card: Card){
        cards.append(card)
    }
    
    // 결과 확인을 위해 패를 깔 때 사용되는 함수
    func checkingCards() -> [String]{
        var cardsDescription: [String] = []
        
        cards.forEach{ card in
            cardsDescription.append(card.description)
        }
        
        return cardsDescription
    }

    init(randomName: String){
        name = randomName
    }
}
