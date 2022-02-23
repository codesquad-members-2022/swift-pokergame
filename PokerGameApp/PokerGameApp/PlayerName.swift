//
//  PlayerName.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation

struct PlayerName {
    private var names : [String] = ["gucci","주방","푸코","피그백","alex","beck","bibi","chez","dale","ebony","eddy","jason","jed","jee","kai","mase","ocean","rosa","sally","selina","shingha","sol"]
    mutating func popName() -> String {
        names.shuffle()
        let name = self.names.popLast() ?? "enonymous"
        return name
    }
}
