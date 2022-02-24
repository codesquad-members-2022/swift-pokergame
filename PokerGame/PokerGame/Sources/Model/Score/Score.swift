//
//  Score.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/23.
//

import Foundation

class Score: CustomStringConvertible, Comparable {
    
    let rule: Rule
    let highNumber: Card.Number
    
    var description: String {
        "\(rule)(\(highNumber))"
    }
    
    init(rule: Rule, highNumber: Card.Number) {
        self.rule = rule
        self.highNumber = highNumber
    }
    
    static func == (lhs: Score, rhs: Score) -> Bool {
        lhs.rule == rhs.rule
    }
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        if lhs.rule == rhs.rule {
            return lhs.highNumber < rhs.highNumber
        }
        return lhs.rule < rhs.rule
    }
}

extension Score {
    private static func findNumberByCount(_ numberCounting: [Card.Number:Int], count: Int) -> [Card.Number] {
        numberCounting.filter{ $0.value == count }.sorted(by: {$0.key > $1.key}).map { $0.key }
    }
    
    static func calculation(player: Player) -> Score? {
        //숫자 별로 갯수를 정리
        let numberCounting = player.cardNumberCounting()
        
        //포카드 체크
        if let cardNumber = findNumberByCount(numberCounting, count: 4).first {
            return Score(rule: .fourCard, highNumber: cardNumber)
        }
        
        //스트레이트 체크
        let sortCard = player.cardSorted()
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
        if let cardNumber = findNumberByCount(numberCounting, count: 3).first{
            return Score(rule: .triple, highNumber: cardNumber)
        } else {
            let ruleNumber = findNumberByCount(numberCounting, count: 2)
            if ruleNumber.count > 0,
               let highNumber = ruleNumber.first{
                return Score(rule: ruleNumber.count >= 2 ? .twoPair : .onePair, highNumber: highNumber)
            }
        }
        
        //해당사항없으면 점수없음
        return nil
    }
}

extension Score {
    enum Rule: Int, Comparable {
        
        case none, onePair, twoPair, triple, straight, fourCard
        
        static func < (lhs: Score.Rule, rhs: Score.Rule) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }
}
