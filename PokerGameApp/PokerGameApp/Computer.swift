//
//  Computer.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/28.
//

import Foundation

struct Computer {
    enum hands: Comparable {
        case onePair
        case twoPair
        case triple
        case straight
        case flush
        case fullHouse
        case fourCard
        case straightFlush
        case royalStraightFlush
    }
}
