//
//  PokerGame.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/25.
//

import Foundation
struct PokerGame {

    //게임이 시작되면 한명의 딜러는 자동 으로 생성됨.
    private let dealer = Dealer(gameDeck: Deck())
    private var playerList = [Player]()
    //한게임의 자리 여유
    private let maxSit = 4
    var numberOfPlayers : NumberOfPlayer
    var gameMode : GameMode
    
    init(numberofPlayers : NumberOfPlayer , mode : GameMode){
        self.numberOfPlayers =  numberofPlayers
        self.gameMode = mode
    }

    mutating func setUp() {
       
    }
    
    mutating func run() {
        setUp()
        do{
//            try dealer.dealCard(to: playerList[0])
            
        }catch {
            switch error {
                case Errors.insufficientCard :
                    print(Errors.insufficientCard.rawValue)
                    exit(1)
                default :
                    print("unknown error occurred")
                
            }
        }
        
    }
    
    
    
    enum NumberOfPlayer : Int{
        case one = 0
        case two
        case three
        case four
    }
    enum GameMode {
        case sevenStud
        case fiveStud
    }
    enum Errors : String, Error {
        case insufficientCard
    }

    
}


