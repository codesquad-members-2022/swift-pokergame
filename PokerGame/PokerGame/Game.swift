//
//  PlayersFactory.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/25.
//


struct Game {

    var dealer:Dealer
    var playerNumber:PlayerMode
    var GameType:GameType
    
    enum PlayerMode {
        case singlePlayer
        case twoPlayer
        case threePlayer
        case fourPlayer
    }

    enum GameType {
        case fiveStud
        case sevenStud
    }
    
}
