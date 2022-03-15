//
//  PlayerProtocal.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/15.
//

import Foundation

protocol Playable {
    var name: String { get }
    
    func receiveToCard(from dealer: Card)
}

