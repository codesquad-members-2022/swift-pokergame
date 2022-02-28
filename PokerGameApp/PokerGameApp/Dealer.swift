//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/28.
//

import Foundation

struct Dealer: Participant, CustomStringConvertible {
    var description: String {
        return "😎Dealer: \(self.cards)"
    }
    
    var cards = [Card]()
    
    
    // 카드를 빼고 (뺀 카드, 전체 카드 상태) 를 리턴합니다.
    func remove(card: CardDeck) -> (Card?, CardDeck?) {
        var currentCard = card
        return (currentCard.removeOne(), currentCard)
    }
}
