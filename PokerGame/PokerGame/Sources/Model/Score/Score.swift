//
//  Score.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/23.
//

import Foundation

class Score: CustomStringConvertible {
    let rule: Rule
    let highNumber: Card.Number
    
    var description: String {
        "\(rule)(\(highNumber))"
    }
    
    init(rule: Rule, highNumber: Card.Number) {
        self.rule = rule
        self.highNumber = highNumber
    }
}

extension Score {
    private static func findRuleNumber(cardByNumber: [Card.Number:Int], findValue: Int) -> Card.Number? {
        cardByNumber.filter{ $0.value == findValue }
        .sorted(by: {$0.key > $1.key})
        .first?.key
    }
    
    static func calculation(player: Player) -> Score? {
        //숫자 별로 갯수를 정리
        var cardByNumber: [Card.Number:Int] = [:]
        player.cards.forEach {
            let count = cardByNumber[$0.number] ?? 0
            cardByNumber[$0.number] = count + 1
        }
        
        //포카드 체크
        if cardByNumber.values.contains(4),
           let ruleNumber = findRuleNumber(cardByNumber: cardByNumber, findValue: 4){
            return Score(rule: .fourCard, highNumber: ruleNumber)
        }
        
        //스트레이트 체크
        let sortCard = player.cards.sorted(by: {return $0.number > $1.number })
        let loopCount = sortCard.count - 5
        for index in 0...loopCount {
            var findNumber = sortCard[index].number.value
            for subIndex in index + 1..<index + 5 {
                if findNumber - 1 != sortCard[subIndex].number.value {
                    findNumber = 0
                    break
                } else {
                    findNumber -= 1
                }
            }
            
            if findNumber != 0 {
                if let findNumber = Card.Number(rawValue: findNumber) {
                    return Score(rule: .straight, highNumber: findNumber)
                }
            }
        }
        
        //트리플, 투페어, 원페어 체크
        if cardByNumber.values.contains(3),
           let ruleNumber = findRuleNumber(cardByNumber: cardByNumber, findValue: 3){
            return Score(rule: .triple, highNumber: ruleNumber)
        } else if cardByNumber.values.contains(2),
                    let ruleNumber = findRuleNumber(cardByNumber: cardByNumber, findValue: 2) {
            let pairCount = cardByNumber.values.filter{ $0 == 2 }.count
            if pairCount >= 2 {
                return Score(rule: .twoPair, highNumber: ruleNumber)
            } else {
                return Score(rule: .onePair, highNumber: ruleNumber)
            }
        }
        
        //해당사항없으면 점수없음
        return nil
    }
}

extension Score {
    enum Rule {
        case none, onePair, twoPair, triple, straight, fourCard
    }
}
