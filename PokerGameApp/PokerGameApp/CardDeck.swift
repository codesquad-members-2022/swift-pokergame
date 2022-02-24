//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/24.
//

import Foundation

struct CardDeck {
    
    private var deck: [Card]
    
    init() {
        deck = CardFactory.deckOfCard()
    }
    
    func count() -> Int {
        return deck.count
    }
    
    mutating func shuffle(using method: ShuffleAlgorithms = .FisherYates) {
        
        // 덱의 카드가 2개도 되지 않으면 셔플을 실행할 의미가 없다고 판단하였습니다.
        guard deck.count >= 2 else { return }
        
        switch method {
        case .FisherYates:
            fisherYatesAlgorithm(cards: &deck)
        case .Knuth:
            knuthAlgorithm(cards: &deck)
        case .Ordinary:
            ordinaryCardShuffle(cards: &deck)
        }
    }
    
    // 기존 덱을 복사한 뒤 Element들을 모두 삭제하고
    // 복사한 덱을 무작위로 하나씩 삭제한 뒤 삭제한 카드를 차례대로 추가합니다.
    private func fisherYatesAlgorithm(cards: inout [Card]) {
        
        var deckForShuffle = deck
        cards.removeAll()
        while let card = deckForShuffle.randomElement() {
            deckForShuffle.removeAll(where: {$0 == card})
            cards.append(card)
        }
    }
    
    // 기존 덱만큼 For-Loop를 실행시키고 Loop당 인덱스에서 카드를 뽑아 '현재 Element'
    // 덱에서 무작위 인덱스를 뽑아 덱에서 카드를 뽑고 '랜덤 Element'로 정의하고 서로 바꿔줍니다.
    private func knuthAlgorithm(cards: inout [Card]) {
        
        var randomIndex: Int {
            (0..<cards.count).randomElement() ?? 0
        }
        
        for i in 0..<cards.count {
//            cards.swapAt(i, randomIndex)
            let randomElement = cards[randomIndex]
            let currentElement = cards[i]
            cards[i] = randomElement
            cards[randomIndex] = currentElement
        }
    }
    
    // 카드를 반으로 나눈 후 왼쪽 혹은 오른쪽 카드 먼저 배치하고
    // 반대편의 카드 하나를 배치하는 식으로 일상생활에서 자주 사용하는 방법으로 카드를 섞습니다.
    private func ordinaryCardShuffle(cards: inout [Card]) {
        
        var isOrderLeft = [1,2].randomElement()!.isMultiple(of: 2)
        var leftHandOfCards = cards[0..<(cards.count/2)]
        var rightHandOfCards = cards[(cards.count/2)...(cards.count-1)]
        
        for i in 0..<cards.count {
            
            guard (isOrderLeft ? leftHandOfCards : rightHandOfCards).isEmpty == false else {
                continue
            }
            
            let card = isOrderLeft ? leftHandOfCards.removeFirst() : rightHandOfCards.removeFirst()
            cards[i] = card
            isOrderLeft.toggle()
        }
    }
    
    mutating func removeOne() -> Card? {
        guard let card = deck.last else { return nil }
        deck.removeLast()
        return card
    }
    
    mutating func reset() {
        deck = CardFactory.deckOfCard()
    }
    
    enum ShuffleAlgorithms: String {
        case FisherYates = "FisherYates"
        case Knuth = "Knuth"
        case Ordinary = "Ordinary"
    }
}
