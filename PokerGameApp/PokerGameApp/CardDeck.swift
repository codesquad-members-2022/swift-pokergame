//
//  CardDeck.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/23.
//

import Foundation

//덱에 있는 카드 위치, 갯수 에 대한 정보를 하나의 객체 에서 관리 하기위해서 class 로 Deck 을 구현.
class Deck {
    //덱의 카드 내용을 private 으로 지정함으로써 은닉화.
    //인덱스를 이용한 shuffle 과 마지막에 있는 카드를 삭제해주는 과정을 쉽게해주기 위해 배열 타입으로 정의.
    //fileprivate --> 밑에 테스트 클래스에서 사용하려고 해당 파일안에서만 공유가능하게 사용함.
    fileprivate var cards = [Card]()
    
    //현재 카드 갯수 정보
    var count : Int {cards.count}
        
    
    init () {
       generateCards()
    }
    
    //모든 suit 와 rank 를 돌면서 cards 배열에 append.
    private func generateCards() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases{
                self.cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    //Optimized Fisher-Yates algorithm by Durstenfeld
    //해당 덱에있는 카드들의 순서를 무작위로 바꾼다.
    func shuffle() {
        var scratch  = self.cards
        var range = self.count
        while range != 1 {
            let roll = Int.random(in: 0..<range)
            let temp = scratch[range-1]
            scratch[range-1] = scratch[roll]
            scratch[roll] = temp
            range -= 1
        }
        //랜덤 순열을 reversed 해서 self.cards 에 할당.
        self.cards = scratch.reversed()
    }
  
    //removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
    //카드 뭉치 중에 무작위로 하나를 반환하고 삭제하는지, 카드 뭉치 들중 가장위에 있는 카드를 뽑아서 반환하고 삭제하건지 명확히 명시되어 있지않아
    //카드뭉치의 맨 위에 있는카드를 뽑아 반환하고 삭제하는것으로 가정하고 함수 구현. 이 가정이 틀릴시 수정 필요.
    func removeOne() -> Card {
        return self.cards.removeLast()
    }
    
    //현재 남아 있는 카드뭉치를 전부 제거한뒤, 새로운 카드뭉치 생성.
    func reset() {
        self.cards.removeAll()
        generateCards()
    }
    
    
}


class DeckTest {
    
    func conductTest()  {
        do {
            print("----덱 생성----")
            let deck = try testCardGeneration()
            print("총 \(deck.count) 개의 카드가 있습니다")
            
            
            print("----카드 하나 뽑기----")
            let lastCard = try testRemoveOne(deck: deck)
            print(lastCard)
            print("총 \(deck.count) 개의 카드가 있습니다")

            print("----카드 섞기----")
            try testShuffle(deck: deck)
            print("총 \(deck.count) 개의 카드가 섞였습니다")
            
            print("----덱 초기화----")
            try testReset(deck: deck)
            print("총 \(deck.count) 개의 카드가 있습니다")
            
            
            print("---- 테스트 완료 ----")
        }
        catch TestError.deckGenerationError {
            print(TestError.deckGenerationError)
        }catch TestError.deckRemoveError{
            print(TestError.deckRemoveError)
        }catch TestError.deckShuffleError{
            print(TestError.deckShuffleError)
        }catch TestError.deckResetError{
            print(TestError.deckResetError)
        }catch{
            print("Unknown error occurred")
        }
        
    }
    
    
    func testCardGeneration() throws -> Deck {
        print("> 덱을 생성 하였습니다.")
        let deck = Deck()
        guard deck.count == 52 else {
            throw TestError.deckGenerationError
        }
        return deck
    }
    
    
    func testRemoveOne(deck: Deck) throws -> Card{
        let cardCount = deck.count
        let lastCard = deck.removeOne()
        if cardCount == deck.count {
            throw TestError.deckRemoveError
        }
        return lastCard
    }
    
    func testShuffle(deck : Deck) throws {
        let firstTenCards = deck.cards[..<10]
        print("> 카드 섞는중")
        deck.shuffle()
        print("섞이기전 앞에서 10장: \(firstTenCards[..<10])")
        print("섞인후 앞에서 10장: \(deck.cards[..<10])")
        if firstTenCards[..<10] == deck.cards[..<10] {
            throw TestError.deckShuffleError
        }
    }
    
    func testReset(deck: Deck) throws {
        print("> 덱 리셋하는중")
        deck.reset()
        if deck.count != 52 {
            throw TestError.deckResetError
        }
    }
    
    enum TestError : Error, CustomStringConvertible {
        
        case deckGenerationError
        case deckRemoveError
        case deckShuffleError
        case deckResetError
        
        var description: String {
            switch self {
            case .deckGenerationError :
                return "Failed to generate Deck"
            case .deckRemoveError :
                return "Failed to remove Card From Deck"
            case .deckShuffleError :
                return "Failed to shuffle Deck"
            case .deckResetError :
                return "Failed to reset Deck"
            }
        }
    }
}
