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
    private static func findNumberByCount(_ numberCounting: [Card.Number:Int], count: Int) -> [Card.Number] {
        numberCounting.filter{ $0.value == count }.sorted(by: {$0.key > $1.key}).map { $0.key }
    }
    
    static func calculation(player: Player) -> Score? {
        //숫자 별로 갯수를 정리
        let numberCounting = player.cards.reduce(into: [Card.Number:Int]()) {
            $0[$1.number] = ($0[$1.number] ?? 0) + 1
        }
        
        //포카드 체크
        if let cardNumber = findNumberByCount(numberCounting, count: 4).first {
            return Score(rule: .fourCard, highNumber: cardNumber)
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
    enum Rule: Int, Equatable {
        case none, onePair, twoPair, triple, straight, fourCard
        
        static func > (lhs: Self, rhs: Self) -> Bool {
            lhs.rawValue > rhs.rawValue
        }
    }
}
