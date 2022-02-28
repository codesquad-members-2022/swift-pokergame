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
    }
    
    func drawCardsToAllMembers() {
        
        guard let cardCount = game.cardCount else { return }
        
        while isGameReady(cardCount) {
            
            for i in 0..<(1+participantCount) {
                
                guard let card = dealer.draw() else { break }
                
                if i == 0 {
                    if dealer.isFull(count: cardCount) == false {
                        dealer.setCard(card)
                    }
                    
                    continue
                }
                
                if gameMembers.members[i-1].isFull(count: cardCount) {
                    gameMembers.members[i-1].cards.append(card)
                }
            }
            
            dealer.shuffle()
        }
    }
    
    private func isGameReady(_ n: Int) -> Bool {
        !gameMembers.isFull(count: n) && !dealer.isFull(count: n)
    }
}

extension PokerGame: CustomStringConvertible {
    var description: String {
        "딜러\(dealer.cards)" + gameMembers.members.reduce("", {"\($0)\n\($1.name)\($1.cards)"})
    }
}
