//
//  Attribute.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/01.
//

import Foundation

// 크게 카드의 속성을 2가지로만 보았을 때 미션에서 제시한 것 처럼 '모양'과 '숫자'를 확인할 수 있었다.
// enum으로 타입을 정의하여 자주 사용되는 property를 중첩으로 묶어서 사용하면 편리할 것 같았다.
enum Suit{
    // 실제 포커에서 사용하는 카드의 모양만 따왔고 이모티콘에서 유니코드로 4가지의 모양만 정의하고있어
    // 데이터를 처리할 때 편리할 것 같아 사용하였다.
    enum Shape: String{
        case Heart = "♥️"
        case Clover = "♣️"
        case Space = "♠️"
        case Diamond = "♦️"
    }
    // 카드가 가지고 있는 숫자들을 Int형태로 그때그때 사용할 수 있지만 값을 추출하여 출력할 때 편리하고
    // 간단할 것 같아 사용하였다.
    enum SuitNumber: Int{
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
        
        // 실제 카드에서 Ace, Jack, Queen, King이 존재하여
        // 따로 스페셜카드로 묶어 사용하기 편할 것 같아 묶게되었다.
        enum SpecialCard: String{
            case one = "A"
            case eleven = "J"
            case twelve = "Q"
            case thirteen = "K"
        }
    }
}
