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
    private var dealer = Dealer()
    private var players: [Player] = []
    
    private var inHandCards = [String:[String]]()
    private var canPlayGame = true
    
    func playPockerGame(){
        // 현재 판 수
        var nowPlay = 1
        // 시작에 앞서 딜러가 카드를 셔플하고 52장 맞는지 확인
        let _ = dealer.shuffleCardDeck()
        
        // 카드덱이 떨어질 때까지 게임 진행 반복
        while canPlayGame{
            // 5장 or 7장 나눠주기
            for _ in 0..<variant.rawValue{
                divideCards()
            }
            
            overOneGame()
            let show = showAllCardInHand()
            
            nowPlay += 1
            clearGame()
            
        }
    }
    
    func divideCards(){
        players.forEach{ player in
            guard let card = dealer.giveCard() else{
                self.canPlayGame = false
                return
            }
            
            player.receiveCard(card: card)
        }
        
        if let card = dealer.giveCard(){
            dealer.receiveCard(card: card)
        } else{
            self.canPlayGame = false
        }
    }
    
    func overOneGame(){
        // 한게임 마무리 시, 현재 참여자들의 카드를 inHandCards에 할당
        players.forEach{ player in
            inHandCards[player.name] = player.checkingCards()
        }
        inHandCards[dealer.role] = dealer.checkingCards()
    }
    
    func showAllCardInHand() -> String{
        var showAll = [String]()
        
        inHandCards.forEach{ playerAndDealer in
            let name = playerAndDealer.key
            let cards = playerAndDealer.value.joined(separator: ",")
            showAll.append("\(name) : \(cards)")
        }
        
        showAll.sort(by: < )
        
        return showAll.joined(separator: " | ")
    }
    
    func clearGame(){
        // 이번 판의 카드들 전부 해제
        inHandCards.removeAll()
        
        players.forEach{ player in
            player.removeCards()
        }
        dealer.removeCards()
    }
    
    init(variant: PockerGame.Variants, entries: PockerGame.Entries){
        self.variant = variant
        self.entries = entries
        
        for _ in 0..<self.entries.rawValue{
            let name = String.makePlayerName()
            let player = Player(randomName: name)
            self.players.append(player)
        }
    }
    
    enum Variants: Int{
        case fiveCardStud = 5, sevenCardStud = 7
    }
    
    enum Entries: Int{
        case one = 1, two = 2, three = 3, four = 4
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
