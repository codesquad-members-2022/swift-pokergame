//
//  Player.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/23.
//

import Foundation

class Player{
    let name: String
    private var cards: [Card] = []
    
    // 딜러가 주는 카드를 받을 때 사용되는 함수
    func receiveCard(card: Card){
        cards.append(card)
    }
    
    // 결과 확인을 위해 패를 깔 때 사용되는 함수
    func showMyCards() -> [String]{
        var cardsDescription: [String] = []
        
        cards.forEach{ card in
            cardsDescription.append(card.description)
        }
        
        return cardsDescription
    }
    
    // 게임 완료 후, 현재 패 버리기
    func removeCards(){
        self.cards.removeAll()
    }

    init(randomName: String){
        name = randomName
    }
}
