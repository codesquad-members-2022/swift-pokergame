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
 
 * 5장의 카드가 모양이 같은지 판단
 * 플러시
 
 * 모양이 같고 숫자가 이어지는지 판단
 * 스트레이트 플러시
 * 백 스트레이트 플러시
 */
import Foundation

class Participant : Playable {
    
    let name: String
    private(set) var playerDeck: [Card] = []
    var cardCount: Int {
        return playerDeck.count
    }
    
    init(name: String) {
        self.name = name
    }
    
    func addCard(card: Card) {
        playerDeck.append(card)
    }
    
    func intruduceYourSelf() -> String {
        return "\(self.name)"
    }

}

extension Participant: Hashable {
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}

extension Participant {
    func computeMyHand(_ computer: Computer) -> Hand {
        return computer.getHand(self)
    }
}
