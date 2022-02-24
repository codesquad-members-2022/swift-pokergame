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
        var studValue: Int{
            return self.rawValue
        }
    }
    enum PlayerNumber: Int{
        case one = 1, two, three, four
        var playerNumber: Int{
            return self.rawValue
        }
    }
    
    private let stud: Stud
    private let dealer = Dealer()
    public private(set) var players: Players
    
    init(stud: Stud, playerNumber: PlayerNumber){
        self.stud = stud
        players = Players(numbers: playerNumber)
    }
    
    func play(){
        for i in 0 ..< stud.studValue{
            for index in 0 ..< players.number{
                guard let card = dealer.takeCardFromDealer() else {
                    return
                }
                players.takeCard(index: index, card: card)
            }
            guard let card = dealer.takeCardFromDealer() else {
                return
            }
            dealer.takeCard(card: card)
        }
    }
}

