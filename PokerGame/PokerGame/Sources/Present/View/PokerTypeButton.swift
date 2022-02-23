//
//  PokerTypeButton.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/24.
//

import Foundation
import UIKit

class PokerTypeButton: UIButton {
    
    public private(set) var pokerType = PokerGame.PokerType.sevenCard
    
    func setButtonValue(pokerType: PokerGame.PokerType) {
        self.pokerType = pokerType
    }
}
