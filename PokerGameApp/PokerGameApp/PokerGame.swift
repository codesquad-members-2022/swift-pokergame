//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/26.
//

import Foundation

class PokerGame {
    
    let gameMembers: GameMembers
    let dealer: Dealer
    
    let participantCount = 3
    let game = TypeOfGame.SevenStudPoker
    
    init() {
        
        gameMembers = GameMembers(numberOf: participantCount, gameType: game)
        
        dealer = Dealer(deck: CardDeck(.deck), gameType: game)
        dealer.shuffleType = gameMembers.getFavoriteShuffle()
        
        drawCardsToAllMembers()
    }
    
    func drawCardsToAllMembers() {
        
        guard let gameCardNumber = game.cardCount else { return }
        
        while isGameReady(gameCardNumber) {
            
            for i in 0..<(1+participantCount) {
                
                guard let card = dealer.draw() else { break }
                
                if i == 0 {
                    if dealer.isFull(count: gameCardNumber) == false {
                        dealer.setCard(card)
                    }
                    
                    continue
                }
                
                if gameMembers.members[i-1].isFull(count: gameCardNumber) {
                    gameMembers.members[i-1].cards.append(card)
                }
            }
            
            if dealer.draw() == nil {
                break
            }
            
            dealer.shuffle()
        }
    }
    
    private func isGameReady(_ number: Int) -> Bool {
        !self.gameMembers.isFull(count: number) || !self.dealer.isFull(count: number)
    }
}

extension PokerGame: CustomStringConvertible {
    var description: String {
        "딜러" + String(describing: dealer.cards) + gameMembers.members.reduce("", {$0 + "\n" + $1.name + String(describing: $1.cards)})
    }
}
