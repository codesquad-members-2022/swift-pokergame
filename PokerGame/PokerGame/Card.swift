//
//  Card.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/21.
//

import Foundation

internal class Card {
    
    let shape: Shape
    let number: Int
    
    // 입력받은 타입에 맞는 유니코드를 출력하기 위해 열거형 사용
    internal enum Shape: String {
        case spade = "\u{2660}", heart = "\u{1F5A4}", diamond = "\u{25C6}", clover = "\u{1F340}"
    }
    
    init(shape: Shape, number: Int){
        self.shape = shape
        self.number = number
    }
    
    func printCardUsingString(){
        print(shape.rawValue + numberConvert(number: number))
    }
    
    // 값 비교 후 형 변환을 위해 switch 사용
    private func numberConvert(number: Int) -> String {
        switch number {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return String(number)
        }
    }
    
    
    
}
