//
//  PlayerProtocal.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/15.
//

import Foundation

protocol Playable {
    var name: String { get }
    var hand: Array<Card> { get }
    
    func receive(card: Card)
}

extension Playable {
    //MARK: 딜러에게 받은 카드 모아놓는 역할
    func receive(card: Card) {
        var receiveCarddeck:Array<Card> = []
        receiveCarddeck.append(card)
    }
}
