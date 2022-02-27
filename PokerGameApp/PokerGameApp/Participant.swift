//
//  Participant.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/27.
//

import Foundation

class Participant {
    
    let gameType: TypeOfGame
    let name: String
    var favoriteShuffle: CardShuffleAlgo
    var cards = [Card]()
    
    init(typeOf game: TypeOfGame) {
        gameType = game
        name = String.randomString(length: (2...5).randomElement()!)
        favoriteShuffle = CardShuffleAlgo.allCases.randomElement()!
    }
    
    func makeMyMindAgain(as algorithm: CardShuffleAlgo? = nil) {
        
        if let algorithm = algorithm {
            self.favoriteShuffle = algorithm
            return
        }
        
        favoriteShuffle = CardShuffleAlgo.allCases.randomElement()!
    }
    
    func isFull(count: Int) -> Bool {
        cards.count <= count
    }
}

extension String {
    static func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
