//
//  Gamblers.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/25.
//

import Foundation

struct Gamblers {
    var listOfGamblers = [Gambler]()
    var count: Int {
        return listOfGamblers.count
    }
    
    subscript(index: Int) -> Gambler {
        return listOfGamblers[index]
    }
    
    init(with numberOfGamblers: numberOfGamblers) {
        var names = ["Sol", "Jee", "Eddy", "Jed", "Dale"]

        for _ in 0..<numberOfGamblers.count {
            let pickedIndex = (0..<names.count).randomElement() ?? 0
            let pickedName = names.remove(at: pickedIndex)
            let newGambler = Gambler(name: pickedName)
            listOfGamblers.append(newGambler)
        }
    }

}

enum numberOfGamblers {
    case one
    case two
    case three
    case four
    
    var count: Int {
        switch self {
            case .one: return 1
            case .two: return 2
            case .three: return 3
            case .four: return 4
        }
    }
}
