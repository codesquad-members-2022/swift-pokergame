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
    }
    enum PlayerNumber: Int{
        case one = 1, two, three, four
    }
    
    private let stud: Stud
    private let dealer = Dealer()
    private var players: [Player] = []
    
    init(stud: Stud, playerNumbers: PlayerNumber){
        self.stud = stud
        for i in 0 ..< playerNumbers.rawValue{
            players.append(Player(name: playerNames[i]))
        }
    }
    
    func play(){
        for i in 0 ..< stud.rawValue{
            for j in 0 ..< players.count{
                getCard(player: players[j])
            }
            getCard(player: dealer)
        }
    }

    private func getCard(player: Player){
        guard let card = dealer.shareCard() else {
            print("덱의 카드가 소진되었으므로 게임을 종료합니다.")
            return
        }
        player.addCard(card: card)
    }
    
    func printPlayerCards(){
        for i in players{
            i.printName()
        }
        dealer.printName()
    }
    
    func testPlayerCards() -> Bool{
        for i in players{
            if i.cardsNumber() != stud.rawValue{
                return false
            }
        }
        if dealer.cardsNumber() != stud.rawValue{
            return false
        }
        return true
    }
    
}

