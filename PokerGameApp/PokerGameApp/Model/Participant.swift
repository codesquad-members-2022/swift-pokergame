import Foundation

class Participant : Playable {
    
    let name: String
    
    private var playerDeck: [Card] = []
    private var hand : Hand = .highCard
    var cardCount: Int {
        return playerDeck.count
    }
    //MARK: 내부 Int 배열의 0번 인덱스는 "A" 이고, 12번 인덱스는 "K"
    private var shapeRankTable: [Shape : [Int]] = [.club : [Int](repeating: 0, count: 13),
                                     .diamond : [Int](repeating: 0, count: 13),
                                     .heart : [Int](repeating: 0, count: 13),
                                     .spade: [Int](repeating: 0, count: 13)]
    
    init(name: String) {
        self.name = name
    }
    
    func openAllCards() -> [Card] {
        return playerDeck
    }
    
    func addCard(card: Card) {
        playerDeck.append(card)
    }
    
    func intruduceYourSelf() -> String {
        return "\(self.name)"
    }
    
    
    /*
     * 숫자가 같은지 판단
        * 숫자가 같은 카드의 수는 몇 개인가?
            * 페어
                * 원페어
                * 투페어
            * 트리플
            * 포카드
        * 페어가 하나 있고, 카드 3개의 숫자가 같으면?
            * 풀하우스
     * 숫자가 연속한지 판단
        * 스트레이트
            * 백스트레이트
     
     * 모양이 같은지 판단
        * 플러시
     
     * 모양이 같고 숫자가 이어지는지 판단
        * 스트레이트 플러시
            * 백 스트레이트 플러시
     */
    
    func caculateHandTalbe()  {
        
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
    }
}
