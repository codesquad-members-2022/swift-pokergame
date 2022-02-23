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
    
    init(playerCount: Int) {
        super.init(frame: CGRect.zero)
        self.playerCount = playerCount
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
