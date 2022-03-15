//
//  Player.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/09.
//

import Foundation

//플레이어의 역할 -> 말그대로 게임하기 -> 덱이 필요없고 카드만 있으면 됨 -> 카드의 속성만 가지고있으면된다.
//-> 총 7장(or 5장)의 카드를 필요로함(배열로선언) -> 히든과 공개의 구분없이 출력
//-> 카드를 클래스로 선언했기때문에 자원의 공유가 가능...

//플레이어(Player)는 포커게임을 하는 플레이어들이 본인들의 패를 감추고 플레이할때 가지고 있는 덱을 소유하고 있는 객체
class Player: Playable {
    
    //MARK: Dealer와 Player 모두 게임을 플레이 할 수 있는 속성을 부여해준다.
    private(set) var name: String
    
    init(name:String) {
        self.name = name
    }
    
}

extension Playable {
    //MARK: 딜러에게 받은 카드 모아놓는 역할 - giveToCard()로 부터 받아온다.
    func receiveToCard(from dealer: Card) {
        var receiveCarddeck: Array<Card> = []
        receiveCarddeck.append(dealer)
        // return 할 수 있을수도 있어서 공백처리
    }
}
