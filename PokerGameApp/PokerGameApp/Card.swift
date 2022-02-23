//
//  Card.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/23.
//

import Foundation

class Card {
    
    enum Shape: String {
        case spades = "♠︎"
        case hearts = "♥︎"
        case clubs = "♣︎"
        case diamonds = "♦︎"
    }
    
    enum Number: String {
        case one = "A"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case eleven = "J"
        case twelve = "Q"
        case thirteen = "K"
    }
    
    // Card에는 모양과 숫자 정보가 담겨 있습니다.
    // 모양 정보와 숫자 정보 모두 정해진 범위가 있으며, 이외의 값이 설정되어서는 안 되기 때문에 둘 다 enum으로 생성했습니다.
    // Shape와 Number를 출력할 때 필요한 본래의 값을 담기 위해 원시값 String을 갖도록 하고, 원시값이 필요한 case에 지정했습니다.
    let shape: Shape
    let number: Number
    
    init(shape: Shape, number: Number) {
        self.shape = shape
        self.number = number
    }
    
    func printInfo() {
        print("\(shape.rawValue)\(number.rawValue)")
    }
    
}


