//
//  InGamePlayers.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/24.
//

import Foundation

struct InGamePlayers{
    private var players: [Player] = []
    
    func showPlayers() -> [Player]{
        return self.players
    }
    
    func playersGetCards(dealer: Dealer) -> Bool{
        var isCardHere = true
        
        players.forEach{ player in
            guard let card = dealer.giveCard() else{
                isCardHere = false
                return
            }
            player.receiveCard(card: card)
        }
        return isCardHere
    }
    
    func inMyHandCard() -> [String: Card]{
        var myCards = [String : Card]()
        
        players.forEach{ player in
            if let card = player.showMyCards().last{
                myCards[player.name] = card
            }
        }
        
        return myCards
    }
    
    func throwAwayCards(){
        players.forEach{ player in
            player.removeCards()
        }
    }
    
    init(entry: PockerGame.Entries){
        for _ in 0..<entry.caseNumber{
            players.append(Player(randomName: String.makePlayerName()))
        }
    }
}
