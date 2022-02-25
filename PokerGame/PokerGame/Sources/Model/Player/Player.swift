//
//  Player.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

class Player: CustomStringConvertible, Comparable {
    let name: String
    private var cards: [Card] = []
    private var score: Score?
    
    var description: String {
        guard let score = score else { 
            return "Name: \(name), cards: \(cards), score: noScore"
        }

        return "Name: \(name), cards: \(cards), score: \(score)"
    }
    
    var hasScore: Bool {
        score != nil
    }
    
    init(name: String) {
        self.name = name
    }
    
    func add(card: Card) {
        cards.append(card)
    }
    
    func removeAllCard() {
        cards.removeAll()
    }
    
    func cardSorted() -> [Card] {
        cards.sorted()
    }
    
    func scoreCalculation() {
        score = scoreCalculated()
    }
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        guard let lhsScore = lhs.score,
              let rhsScore = rhs.score else {
            return false
        }
        return lhsScore < rhsScore
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.score == rhs.score
    }
}

extension Player {
    
    private func findNumberByCount(_ numberCounting: [Card.Number:Int], count: Int) -> [Card.Number] {
        numberCounting.filter{ $0.value == count }.sorted(by: {$0.key > $1.key}).map { $0.key }
    }
    
    func scoreCalculated() -> Score? {
        //숫자 별로 갯수를 정리
        let numberCounting = cards.reduce(into: [Card.Number:Int]()) {
            $0[$1.number] = ($0[$1.number] ?? 0) + 1
        }
        
        //포카드 체크
        if let cardNumber = findNumberByCount(numberCounting, count: 4).first {
            return Score(rule: .fourCard, highNumber: cardNumber)
        }
        
        //스트레이트 체크
        if cards.count >= 5 {
            let sortCard: [Card] = cardSorted().reversed()
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
