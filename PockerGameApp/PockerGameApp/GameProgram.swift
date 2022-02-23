//
//  GameProgram.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

func gameProgram() {
    let myGame = PokerGame(numberOfGamblers: 3)
    myGame.gameScenario()
    
    myGame.gamblers.forEach {
        print($0)
    }
    print(myGame.dealer)
}
