//
//  Dealer.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/09.
//

import Foundation

//딜러의 역할 -> 카드 나눠주기 -> 카드(class)를 나눠주려면? -> 카드덱(struct)을 갖고있어야함
//-> 딜러 또한 struct을 사용 -> 이유는 카드덱의 rawValue를 그대로 사용하는게 관리측면에서 편리하다고 생각
//-> Pockergame을 struct 또는 class로 구현할지 선택이지 dealer는 클래스로 작성

//포커 딜러가 나눠줄 수 있는 게임 방식을 선택 -> 7카드-스터드 or 5카드-스터드 Ok
//-> 딜러의 이름은 없다. -> 카드를 한 번 나눠준 카드는 다시 덱에 넣지않도록 한다.
//-> 카드 개수나 참가자 인원에 대한 입력을 구현할 필요없다.
class Dealer: Playable {
    
    private(set) var cardDeck: Deck
    private(set) var hand: Hand
    private(set) var name: String
    
    init() {
        self.cardDeck = Deck()
        self.name = "Dealer"
        self.hand = Hand()
    }
    
    //MARK: 딜러 -> 참가자에게 카드 전달
    func distributeCard(to participants:Participants, by stud: Int)  {
        participants.players.forEach {
            player in (0..<stud).forEach { _ in player.receive(card: self.cardDeck.removeOne())
            }
        }
    }
    
    //MARK: 카드덱에 얼마나 남아있는지 갯수 확인하여 실행여부 확인 - Edit End -
    func isPossiblePlay(count:Int) -> Bool {
        return self.cardDeck.count() >= count
    }
    
    //MARK: 카드를 모두 초기화하고 셔플하는 역할 - Edit End -
    func generateShuffleDeck() {
        self.cardDeck.reset()
        self.cardDeck.shuffle()
    }
    
    //MARK: 포커게임을 시작 - Edit End -
    func getStartPockerGame(stud: Int, participants: Participants) {
        self.generateShuffleDeck()
        self.distributeCard(to: participants, by: stud)
    }
    
}
