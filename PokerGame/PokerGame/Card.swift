//
//  Card.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/21.
//

import Foundation

class Card {
    
    let shape: Shape
    let number: Int
    
    enum Shape: String {
        case spade = "\u{2660}", heart = "\u{1F5A4}", diamond = "\u{25C6}", clover = "\u{1F340}"
    }
    
    init(shape: Shape, number: Int){
        self.shape = shape
        self.number = number
    }
    
    func printCardUsingString(){
        print(shape.rawValue, numberConvert(number: number))
    }
    
    func numberConvert(number: Int) -> String {
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
