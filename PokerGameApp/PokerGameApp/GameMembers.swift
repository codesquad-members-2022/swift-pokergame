//
//  PokerParticipants.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/27.
//

import Foundation

class GameMembers {
    
    var personCount: Int
    let gameType: TypeOfGame
    
    var members = [PokerParticipant]()
    
    init(numberOf person: Int, gameType type: TypeOfGame) {
        self.personCount = person
        self.gameType = type
        
        members.append(contentsOf: (0..<personCount).map({_ in PokerParticipant()}))
    }
    
    func getFavoriteShuffle() -> CardShuffleAlgo {
        
        var shuffleSet = Dictionary(uniqueKeysWithValues: CardShuffleAlgo.allCases.map { ($0, 0) })
        var maxCount: Int {
            shuffleSet.max(by: { $0.value < $1.value })?.value ?? 0
        }
        
        while shuffleSet.filter({ $0.value == maxCount }).count != 1 {
            
            print("흠... 다시 돌려봅니다. \(shuffleSet)")
            for key in shuffleSet.keys {
                shuffleSet[key] = 0
            }
            
            members.forEach { person in
                person.makeMyMindAgain(as: nil)
                shuffleSet[person.favoriteShuffle]! += 1
            }
        }
        
        return shuffleSet.max(by: { $0.value < $1.value })!.key
    }
    
    func isFull(count: Int) -> Bool {
        members.filter({ $0.cards.count >= count }).count == members.count
    }
}

extension GameMembers: CustomStringConvertible {
    var description: String {
        members.reduce("", {$0+$1.name+"\n"})
    }
}
