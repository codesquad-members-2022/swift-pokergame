//
//  Playable.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/28.
//

import Foundation

protocol Playable {
    func addCard(card: Card)
    func intruduceYourSelf() -> String
}
