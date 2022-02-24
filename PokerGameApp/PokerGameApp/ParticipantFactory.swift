//
//  ParticipantFactory.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/25.
//

import Foundation

struct ParticipantFactory {
    static func generateGuests(count: GuestCount) -> [Guest] {
        var guests = [Guest]()
        for _ in 0..<count.rawValue {
            guard let randomName = PersonName.allCases.randomElement() else {
                continue
            }
            let guest = Guest(name: randomName.rawValue)
            guests.append(guest)
        }
        return guests
    }
    
    enum PersonName: String,CaseIterable {
        case shingha = "shingha"
        case chez = "chex"
        case jee = "jee"
        case bibi = "bibi"
        case ebony = "ebony"
        case mase = "mase"
        case pigbag = "pigbag"
        case joobang = "joobang"
        case dale = "dale"
        case alex = "alex"
        case eddy = "eddy"
    }
}
