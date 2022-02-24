//
//  Player.swift
//  PockerGameApp
//
//  Created by 김동준 on 2022/02/24.
//

import Foundation

class Player{
    private let name: String
    private var cards: [PockerCard] = []
    
    init(name: String){
        self.name = name
    }
    
    func addCard(card: PockerCard){
        self.cards.append(card)
    }
    
    func printName(){
        print("\(name) \(cards.map{"\($0.shape)\($0.number)"})")
    }
    
    func cardsNumber() -> Int{
        return cards.count
    }
    
}
