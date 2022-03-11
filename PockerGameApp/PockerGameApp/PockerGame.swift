//
//  PockerGame.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/11.
//

import Foundation

//포커게임의 역할 -> 카드와 카드덱의 속성 모두를 포함해야한다.
//-> 7카드-스터드 방식과 5카드-스터드 방식 모두를 지원하게끔 선택지를 준다.
//-> 카드 게임 종류와 참가자 수에 따라 적절하게 동작해야한다.
//-> XCTest를 위한 테스트 타깃을 추가한다.
//-> 테스트 코드에서 PockerGame 메소드를 호출해서 동작을 확인.

class PockerGame:Dealer {
    var player = Player()
    
    //MARK: 카드게임 종류와 참가자수에 따라 적절하게 동작
    func startGame(receiveFrom studNumber:Int) {
        //게임 종류에 따라 게임 시작
        if studNumber == 7 {
            sevenCardStud()
        } else if studNumber == 5 {
            fiveCardStud()
        } else {
            exit(1)
        }
    }
    
    //MARK: UnitTest 실행할 내용
    func unitTestCode() {
        
    }
    
}
