import Foundation

class Computer {
    private var pairsCount = 0
    private var isTriple : Bool = false
    private var isFourCard : Bool = false
    private var shapeRankTable: [Shape : [Int]] = [.club : [Int](repeating: 0, count: 13),
                                                   .diamond : [Int](repeating: 0, count: 13),
                                                   .heart : [Int](repeating: 0, count: 13),
                                                   .spade: [Int](repeating: 0, count: 13)]
    private var countPerShape : [Shape: Int] = [.heart : 0,
                                                .spade : 0,
                                                .club : 0,
                                                .diamond : 0]
    
    private var sumOfShapes : [Int]?
    
    private var isStraight : Bool {
        guard let sumOfShapes = self.sumOfShapes else {
            return false
        }
        for index in 0..<10 {
            if sumOfShapes[index] > 0 &&
                sumOfShapes[index+1] > 0 &&
                sumOfShapes[index+2] > 0 &&
                sumOfShapes[index+3] > 0 &&
                sumOfShapes[index+4] > 0 {
                return true
            }
        }
        //TODO: 고칠것
        return false
    }
    private var isFlush : Bool {
        for key in shapeRankTable.keys {
            shapeRankTable[key]?.forEach({ index in
                countPerShape[key]! += index
            })
        }
        
        for value in countPerShape.values {
            if value >= 5 {
                return true
            }
        }
        return false
    }
    //TODO: 고칠것 2
    func checkStraightFlush() -> Bool {
        return false
    }
    
    //MARK: 컴퓨터 클래스에서는 이 메서드만 실행될것임
    func getHand(_ player: Participant) -> Hand {
        shapeRankTable = caculateHandTable(player.playerDeck)
        sumOfShapes = getSumOfShapes(shapeRankTable)
        checkSameRankCard(sumOfShapes)
        //TODO: 고칠것 3
        return Hand.highCard
    }
    
    private func caculateHandTable(_ playerDeck: [Card]) -> [Shape : [Int]] {
        
        playerDeck.forEach { card in
            let rank2Index = card.rank.rawValue - 1
            switch card.shape {
            case .spade:
                shapeRankTable[.spade]![rank2Index] += 1
            case .diamond:
                shapeRankTable[.diamond]![rank2Index] += 1
            case .club:
                shapeRankTable[.club]![rank2Index] += 1
            case .heart:
                shapeRankTable[.heart]![rank2Index] += 1
            }
        }
        return shapeRankTable
    }
    
    private func getSumOfShapes(_ cardTable: [Shape : [Int]] ) -> [Int] {
        var array = [Int](repeating: 0, count: 13)
        for value in cardTable.values {
            for index in 0..<array.count {
                array[index] += value[index]
            }
        }
        return array
    }
    
    // 같은 숫자의 패가 있는지 확인
    private func checkSameRankCard(_ lineForNumber: [Int]?) {
        guard let sumOfShapes = lineForNumber else {
            return
        }
        sumOfShapes.forEach { index in
            switch index {
            case 2:
                pairsCount += 1
            case 3:
                isTriple = true
            case 4:
                isFourCard = true
            default:
                print("")
            }
        }
    }
 }

