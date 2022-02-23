//
//  CardDeck.swift
//  PockerGameApp
//
//  Created by 김동준 on 2022/02/22.
//

import Foundation
struct CardDeck{
    public var count: Int{
        return cardDeckArray.count
    }
    public private(set) var cardDeckArray: [PockerCard] = []
    private let cardShapes = PockerCard.Shape.allCases
    private let cardNumbers = PockerCard.Number.allCases
    
    init(){
        reset()
    }
    
    private mutating func initCardDeckArray(){
        for shape in cardShapes{
            for number in cardNumbers{
                let card = PockerCard(shape: shape, number: number)
                cardDeckArray.append(card)
            }
        }
    }
    
    mutating func shuffle(){
        for i in 0 ..< cardDeckArray.count - 1 { // 0 ~ n-2
            let randomIndex = Int.random(in: i ..< cardDeckArray.count)
            let temp = cardDeckArray[i]
            cardDeckArray[i] = cardDeckArray[randomIndex]
            cardDeckArray[randomIndex] = temp
        }
    }
    
    mutating func removeOne() -> PockerCard{
        guard let card = cardDeckArray.last else { return PockerCard(shape: .diamonds, number: .queen) }
        cardDeckArray.removeLast()
        return card
    }
    
    mutating func reset(){
        cardDeckArray = []
        initCardDeckArray()
        shuffle()
    }
}

extension CardDeck: CardDeckTest{
    mutating func resetTest() -> Bool{
        self.reset()
        return count == 52
    }
    
    mutating func shuffleTest(cardDeckArray: [PockerCard]) -> Bool{
        self.shuffle()
        let duplicated = zip(self.cardDeckArray, cardDeckArray).enumerated().filter() {
            $1.0.number == $1.1.number && $1.0.shape == $1.1.shape
        }
        let duplicatedCount = duplicated.map{$0.offset}.count
        return self.count > duplicatedCount
    }
    
    mutating func removeOneTest(count: Int) -> Bool{
        return self.count - 1 == count
    }
}

protocol CardDeckTest{
    mutating func resetTest() -> Bool
    mutating func shuffleTest(cardDeckArray: [PockerCard]) -> Bool
    mutating func removeOneTest(count: Int) -> Bool
}
