//
//  Score.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/23.
//

import Foundation

class Score {
    
    let rule: Rule
    let highNumber: Int
    
    init(rule: Rule, highNumber: Int) {
        self.rule = rule
        self.highNumber = highNumber
    }
    
    private static func findRuleNumber(cardByNumber: [Card.Number:Int], findValue: Int) -> Card.Number? {
        cardByNumber.filter{ $0.value == findValue }
        .sorted(by: {$0.key.rawValue > $1.key.rawValue})
        .first?.key
    }
    
    static func calculation(player: Player) -> Score? {
        var cardByNumber: [Card.Number:Int] = [:]
        player.cards.forEach {
            let count = cardByNumber[$0.number] ?? 0
            cardByNumber[$0.number] = count + 1
        }
        
        if cardByNumber.values.contains(4),
           let ruleNumber = findRuleNumber(cardByNumber: cardByNumber, findValue: 4){
            return Score(rule: .fourCard, highNumber: ruleNumber.rawValue)
        }
        
        let sortCard = player.cards.sorted(by: {return $0.number.rawValue > $1.number.rawValue })
        let loopCount = sortCard.count - 5
        for index in 0...loopCount {
            var findNumber = sortCard[index].number.rawValue
            for subIndex in index + 1..<index + 5 {
                if findNumber - 1 != sortCard[subIndex].number.rawValue {
                    findNumber = 0
                    break
                } else {
                    findNumber -= 1
                }
            }
            
            if findNumber != 0 {
                return Score(rule: .straight, highNumber: findNumber)
            }
        }
        
        if cardByNumber.values.contains(3),
           let ruleNumber = findRuleNumber(cardByNumber: cardByNumber, findValue: 3){
            return Score(rule: .triple, highNumber: ruleNumber.rawValue)
        } else if cardByNumber.values.contains(2),
                  let ruleNumber = findRuleNumber(cardByNumber: cardByNumber, findValue: 2) {
            let pairCount = cardByNumber.values.filter{ $0 == 2 }.count
            if pairCount >= 2 {
                return Score(rule: .twoPair, highNumber: ruleNumber.rawValue)
            } else {
                return Score(rule: .onePair, highNumber: ruleNumber.rawValue)
            }
        }
        
        return nil
    }
}

extension Score {
    enum Rule {
        case none, onePair, twoPair, triple, straight, fourCard
    }
}
