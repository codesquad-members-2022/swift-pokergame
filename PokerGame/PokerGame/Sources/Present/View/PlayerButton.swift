//
//  PlayerButton.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/23.
//

import Foundation
import UIKit

class PlayerButton: UIButton {
    
    public private(set) var playerCount = 0
    
    func setButtonValue(playerCount: Int) {
        self.playerCount = playerCount
    }
}
