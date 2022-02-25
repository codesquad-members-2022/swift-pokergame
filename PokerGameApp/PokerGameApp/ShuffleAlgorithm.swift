//
//  ShuffleAlgorithm.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/25.
//

import Foundation

final class ShuffleAlgorithm<T: Array<AnyObject>.Element> {
    
    // 타입이 Int도 가능하지만 Array.Index가 더 직접적인 표현인 것 같아서 Array.Index로 표기하였습니다.
    // random한 인덱스는 배열을 섞는 알고리즘에 공통적으로 필요하다 판단하여 로컬 프로시저로 빼 놓았습니다.
    private var randomIndex: (Array<AnyObject>) -> Array<AnyObject>.Index? = { param -> Array<AnyObject>.Index? in
        return param.isEmpty ? nil : (0..<param.count).randomElement()
    }
    
    // 기존 덱을 복사한 뒤 Element들을 모두 삭제하고
    // 복사한 덱을 무작위로 하나씩 삭제한 뒤 삭제한 카드를 차례대로 추가합니다.
    func fisherYatesAlgorithm(at array: inout [T]) { // Generic을 사용하여 어떠한 Array에도 적용되도록 하였습니다.
        
        guard array.count >= 2 else { return }
        
        var deckForShuffle = array
        array.removeAll()
        
        while let index = randomIndex(deckForShuffle) {
            array.append( deckForShuffle.remove(at: index) )
        }
    }
    
    // 기존 덱만큼 For-Loop를 실행시키고 Loop당 인덱스에서 카드를 뽑아 '현재 Element'
    // 덱에서 무작위 인덱스를 뽑아 덱에서 카드를 뽑고 '랜덤 Element'로 정의하고 서로 바꿔줍니다.
    func knuthAlgorithm(at array: inout [T]) {
        
        guard array.count >= 2 else { return }
        
        for i in 0..<array.count {
//            cards.swapAt(i, randomIndex)
            
            guard let randomIndex = randomIndex(array) else { continue }
            
            let randomElement = array[randomIndex]
            let currentElement = array[i]
            array[i] = randomElement
            array[randomIndex] = currentElement
        }
    }
    
    // 카드를 반으로 나눈 후 왼쪽 혹은 오른쪽 카드 먼저 배치하고
    // 반대편의 카드 하나를 배치하는 식으로 일상생활에서 자주 사용하는 방법으로 카드를 섞습니다.
    func ordinaryCardShuffle(at array: inout [T]) {
        
        guard array.count >= 2 else { return }
        
        let deckCount = array.count
        var isOrderLeft = [1,2].randomElement()!.isMultiple(of: 2)
        
        var leftHandOfCards = Array(array[0..<(array.count/2)])
        var rightHandOfCards = array
        
        array.removeAll()
        
        for _ in 0..<deckCount {
            
            guard (isOrderLeft ? leftHandOfCards : rightHandOfCards).isEmpty == false else { continue }
            
            let card = isOrderLeft ? leftHandOfCards.removeFirst() : rightHandOfCards.removeFirst()
            array.append(card)
            isOrderLeft.toggle()
        }
    }
}
