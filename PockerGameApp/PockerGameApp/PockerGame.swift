//
//  PockerGame.swift
//  PockerGameApp
//
//  Created by 김동준 on 2022/02/24.
//

import Foundation

struct PockerGame{
    private let playerNames: [String] = ["ebony","eddy","gucci","chez"]
    enum Stud: Int{
        case five = 5
        case seven = 7
        func needCardCount() -> Int{
            return self.rawValue
        }
    }
    enum PlayerCount: Int{
        case one = 1, two, three, four
        func getNumberOfPlayer() -> Int{
            return self.rawValue
        }
    }
    
    private let stud: Stud
    private let dealer = Dealer()
    public private(set) var players: Players
    
    init(stud: Stud, playerCount: PlayerCount){
        self.stud = stud
        players = Players(playerCount: playerCount)
    }
    
    func play(){
        for _ in 0 ..< stud.needCardCount(){
            for index in 0 ..< players.count{
                guard let card = dealer.giveCardToPlayer() else {
                    return
                }
                players.takeCard(index: index, card: card)
            }
            guard let card = dealer.giveCardToPlayer() else {
                return
            }
            dealer.receiveCard(card: card)
        }
    }
}

