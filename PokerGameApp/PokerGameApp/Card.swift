//
//  Card.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/23.
//

import Foundation

class Card {
    
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


