//
//  Player.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/09.
//

import Foundation

//플레이어의 역할 -> 말그대로 게임하기 -> 덱이 필요없고 카드만 있으면 됨 -> 카드의 속성만 가지고있으면된다.
//-> 총 7장(or 5장)의 카드를 필요로함(배열로선언) -> 히든과 공개의 구분없이 출력 -> 참가자는 1~4명을 어떻게 넣어줄 것인가??
//-> 카드를 클래스로 선언했기때문에 자원의 공유가 가능...
class Player {
    
    //MARK: 참가자(1~4명) 랜덤으로 생성
    func makeRandomParticipant() {
        let participant: Array<Int>
        
    }
    
    //MARK: 참가자 랜덤하게 배정 -> makeRandomParticipant() 안에 중첩으로 만들 수 있을까?
    func makeRandomName() -> Array<String> {
        // 2~5글자 이내의 참가자들 중 참가자 랜덤으로 배정
        let participant = ["Chole", "Honux", "Crong", "JK", "Jin", "Koon"]
        var storageParticipant = [String]()
        
        for order in 0..<participant.count {
            switch participant[order].count {
            case 2...5:
                storageParticipant[order].append(participant[order])
            default:
                exit(1)
            }
        }
        return storageParticipant
    }R
    
    //MARK: 딜러에게 받은 카드 모아놓는 역할
    func receiveToCard() {
        let receiveCarddeck: Array<Card>
        
    }
    
}
