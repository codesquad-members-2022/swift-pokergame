//
//  PockerGame.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/23.
//

import Foundation

class PockerGame{
    private var variant: PockerGame.Variants
    private var entries: PockerGame.Entries
    private var players: InGamePlayers
    private var dealer = Dealer(role: "Dealer")
    
    private var inHandCards = [String:[Card]]()
    private var canPlayGame = true
    
    func playingLoop() -> Bool{
        return canPlayGame
    }
    
    func changeVariant(variant: PockerGame.Variants){
        self.variant = variant
    }
    
    func entryPlayers() -> InGamePlayers{
        return self.players
    }
    
    func entryDealer() -> Dealer{
        return self.dealer
    }
    
    func dealerShuffle() -> Int{
        let cardCount = self.dealer.shuffleCardDeck()
        return cardCount
    }
    
    func divideCards(){
        self.canPlayGame = players.playersGetCards(dealer: dealer)
        
        if let card = dealer.giveCard(){
            dealer.receiveCard(card: card)
        } else{
            self.canPlayGame = false
        }
        
        overOneTurn()
    }
    
    func overOneTurn(){
        let playersCard = players.inMyHandCard()
        playersCard.forEach{ player in
            if inHandCards[player.key] != nil{
                inHandCards[player.key]?.append(player.value)
            } else{
                inHandCards[player.key] = [player.value]
            }
        }
        
        if let dealerCard = dealer.showMyCards().last{
            if inHandCards[dealer.role] != nil{
                inHandCards[dealer.role]?.append(dealerCard)
            } else{
                inHandCards[dealer.role] = [dealerCard]
            }
        }
    }
    
    func showAllCardInHand() -> String{
        var showAll = [String]()
        
        inHandCards.forEach{ playerAndDealer in
            var cards = [String]()
            let name = playerAndDealer.key
            playerAndDealer.value.forEach{ card in
                cards.append(card.description)
            }
            
            let cardsDescription = cards.joined(separator: ",")
            showAll.append("\(name) : \(cardsDescription)")
        }
        
        showAll.sort(by: < )
        
        return showAll.joined(separator: " | ")
    }
    
    func clearGame(){
        inHandCards.removeAll()
        
        players.throwAwayCards()
        dealer.removeCards()
    }
    
    init(variant: PockerGame.Variants, entries: PockerGame.Entries){
        self.variant = variant
        self.entries = entries
        self.players = InGamePlayers(entry: self.entries)
        
    }
    
    enum Variants: CaseIterable{
        case fiveCardStud
        case sevenCardStud
        
        var caseNumber: Int{
            switch self {
            case .fiveCardStud:
                return 5
            case .sevenCardStud:
                return 7
            }
        }
    }
    
    enum Entries: CaseIterable{
        case two
        case three
        case four
        
        var caseNumber: Int{
            switch self {
            case .two:
                return 2
            case .three:
                return 3
            case .four:
                return 4
            }
        }
    }
}

extension String{
    static func makePlayerName() -> String{
        let alphabet: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        let nameLength = Int.random(in: 2...5)
        var name: [String] = []
        
        for _ in 0..<nameLength{
            if name.isEmpty{
                let upperCase = alphabet.randomElement()?.uppercased()
                name.append(upperCase ?? "1")
            } else{
                name.append(alphabet.randomElement() ?? "1")
            }
        }
        
        return name.joined()
    }
}
