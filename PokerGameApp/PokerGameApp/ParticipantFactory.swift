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
        var appendedNames = [String]()
        
        for _ in 0..<count.rawValue {
            var newName = ""
            var isExsistName = true
            while (isExsistName) {
                guard let randomName = PersonName.allCases.randomElement() else {
                    continue
                }
                if !appendedNames.contains(randomName.rawValue) {
                    newName = randomName.rawValue
                    isExsistName = false
                }
            }
            let guest = Guest(name: newName)
            guests.append(guest)
            appendedNames.append(guest.state().name)
        }
        return guests
    }
    
    static func generateDealer(stud: Stud) -> Dealer {
        return Dealer(name: "딜러", stud: stud)
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
