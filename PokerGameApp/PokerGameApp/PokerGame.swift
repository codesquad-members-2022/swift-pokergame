//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/26.
//

import Foundation

class PokerGame {
    
    var gameMembers: GameMembers
    let dealer: Dealer
    
    let participantCount = 3
    let game = TypeOfGame.SevenStudPoker
    
    lazy var isGameReady: (Int) -> Bool = { number -> Bool in
        !self.gameMembers.isFull(count: number) || !self.dealer.isFull(count: number)
    }
    
    init() {
        
        gameMembers = GameMembers(numberOf: participantCount, gameType: game)
        
        dealer = Dealer(deck: CardDeck(.deck), gameType: game)
        dealer.shuffleType = gameMembers.getFavoriteShuffle()
        
        drawCardsToAllMembers()
    }
    
    func drawCardsToAllMembers() {
        
        let fullCardNumber = game == .SevenStudPoker ? 7 : 5
        
        while isGameReady(fullCardNumber) {
            
            for i in 0..<(1+participantCount) {
                
                guard let card = dealer.draw() else { break }
                
                if i == 0 {
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
