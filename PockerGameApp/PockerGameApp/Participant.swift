//
//  Participant.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/15.
//

import Foundation

// 참가자(Participant)는 포커게임에 참가하는 인원이 누군지만 확인하는 객체
class Participant {
    
    //MARK: 참가자 랜덤하게 배정 -> makeRandomParticipant() 안에 중첩으로 만들 수 있을까?
    func makeRandomMember(with Number:Int) -> Array<String> {
        // 2~5글자 이내의 참가자들 중 참가자 랜덤으로 배정
        let participant = ["Chole", "Honux", "Crong", "JK", "Jin", "Rosa"]
        var storageParticipant = [String]()
        
        for order in 0..<Number {
            switch participant[order].count {
            case 2...5:
                storageParticipant[order].append(participant[order])
            default:
                exit(1)
            }
        }
        return storageParticipant.shuffled()
    }
    
}
