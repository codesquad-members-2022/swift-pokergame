//
//  PokerGame.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/25.
//

import Foundation
struct PokerGame {
    
    private let dealer = Dealer(gameDeck: Deck())
    private let player = Player(name: .Luan)
//    private let gameMode : Mode
    
    func setMode () {
        
    }
    
    func start() {
        do{
            
            try dealer.dealCard(to: player)
            
        }catch {
            switch error {
            case Errors.insufficientCard :
                print(Errors.insufficientCard.rawValue)
                exit(1)
            default :
                print("unknown error occurred")
                
            }
        }
        
        print(player)
    }
    
    
    
    
    
}


enum Mode {
    
}

enum Errors : String, Error {
    case insufficientCard
}
