//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/26.
//

import Foundation

class PokerGame {
    
    let dealer: Dealer
    var gameMembers: GameMembers
    
    lazy var isGameReady: (Int) -> Bool = { number -> Bool in
        !self.gameMembers.isFull(count: number) || !self.dealer.isFull(count: number)
    }
    
    init() {
        
        let participantCount = 3
        let game = TypeOfGame.SevenStudPoker
        let fullCardNumber = game == .SevenStudPoker ? 7 : 5
        
        gameMembers = GameMembers(numberOf: participantCount, gameType: game)
        
        print("이름 한번씩 말씀해주십시오.")
        print(gameMembers)
        
        print("카드 준비중입니다.")
        dealer = Dealer(deck: CardDeck(.deck), gameType: game)
        
        print("카드를 섞습니다. 어떤식으로 섞을까요? 의견을 종합해 보겠습니다.")
        let shuffleAlgo = gameMembers.getFavoriteShuffle()
        print(shuffleAlgo)
        dealer.shuffleType = shuffleAlgo
        
        while isGameReady(fullCardNumber) {
            
            for i in 0..<(1+participantCount) {
                
                guard let card = dealer.draw() else { break }
                
                if i == 0 && dealer.isFull(count: fullCardNumber) == false {
                    if dealer.isFull(count: fullCardNumber) == false {
                        dealer.cards.append(card)
                    }
                    
                    continue
                }
                
                if gameMembers.members[i-1].isFull(count: fullCardNumber) {
                    gameMembers.members[i-1].cards.append(card)
                }
            }
            
            if dealer.draw() == nil {
                break
            }
            
            dealer.shuffle()
        }
    }
}

extension PokerGame: CustomStringConvertible {
    var description: String {
        "딜러" + String(describing: dealer.cards) + gameMembers.members.reduce("", {$0 + "\n" + $1.name + String(describing: $1.cards)})
    }
}
