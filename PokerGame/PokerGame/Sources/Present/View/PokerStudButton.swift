//
//  PokerStudButton.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/24.
//

import Foundation
import UIKit

class PokerStudButton: UIButton {
    
    public private(set) var pokerStud = PokerGame.Stud.sevenCard
    
    init(pokerStud: PokerGame.Stud) {
        super.init(frame: CGRect.zero)
        self.pokerStud = pokerStud
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
