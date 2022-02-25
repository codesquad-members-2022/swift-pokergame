//
//  PokerGame.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/25.
//

import Foundation

class PokerGame {
    
    enum Stud: Int {
        case five
        case seven
        
        var cardCountForGame: Int {
            switch self {
            case .five:
                return 5
            case .seven:
                return 7
            }
        }
    }
    
    enum PlayerCount: Int {
        case one = 1
        case two
        case three
        case four
        
        var excludeDealer: Int {
            return self.rawValue
        }
    }

    private var stud: Stud
    private var playerCount: PlayerCount
    private var dealer: Dealer
    private var participants: Participants
    
    var getPlayersHand: String {
        var str = ""
        
        self.participants.players.forEach { player in
            str += "\(player.name) \(player.hand.getCards)\n"
        }
        
        return str
    }
    
    init(stud: Stud, playerCount: PlayerCount) {
        self.stud = stud
        self.playerCount = playerCount
        self.dealer = Dealer()
        self.participants = Participants(playerCount: playerCount.excludeDealer, dealer: dealer)
    }

    func start() {
        if dealer.canDrawCards(count: stud.cardCountForGame * participants.count) {
            dealer.setUpPokerGame(stud: stud.cardCountForGame, participants: participants)
        }
        else {
            // TODO: 종료 처리에 대한 코드 작성
        }
    }
}
