//
//  InGamePlayers.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/24.
//

import Foundation

struct InGamePlayers{
    private var players: [Player] = []
    
    func playersGetCards(dealer: Dealer){
        players.forEach{ player in
            guard let card = dealer.giveCard() else{
                return
            }
            player.receiveCard(card: card)
        }
    }
    
    func inMyHandCard() -> [String: String]{
        var myCards = [String : String]()
        
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
    
    init(entry: Int){
        for _ in 0..<entry{
            players.append(Player(randomName: String.makePlayerName()))
        }
    }
}
