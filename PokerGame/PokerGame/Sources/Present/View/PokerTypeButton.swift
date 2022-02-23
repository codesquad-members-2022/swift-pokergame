//
//  PokerTypeButton.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/24.
//

import Foundation
import UIKit

class PokerTypeButton: UIButton {
    
    public private(set) var pokerType = PokerGame.Stud.sevenCard
    
    init(pokerType: PokerGame.Stud) {
        super.init(frame: CGRect.zero)
        self.pokerType = pokerType
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
