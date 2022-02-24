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


