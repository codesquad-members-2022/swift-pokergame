//
//  PlayerFactory.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/25.
//


final class PlayerFactory {
        
    //참가자의 최대 인원이 4명이므로 Int같은 값을 주기보다는 제한된 값을 주고 싶어서 enum으로 선언했다.
    func makePlayers(mode:PlayerMode) -> [Player] {
        switch mode {
        case .singlePlayer:
            return self.singlePlayer()
        case .twoPlayer:
            return self.twoPlayer()
        case .threePlayer:
            return self.threePlayer()
        case .fourPlayer:
            return self.FourPlayer()
        }
    }
    
    //enum에서 switch할때 타입을 맞춰주기 위해서 [player]로 타입을 맞추어 주었다.
    private func singlePlayer() -> [Player] {
        makePlayerWithNumber(number: 1)
    }

    private func twoPlayer() -> [Player] {
        makePlayerWithNumber(number: 2)
    }

    private func threePlayer() -> [Player] {
        makePlayerWithNumber(number: 3)
    }

    private func FourPlayer() -> [Player] {
        makePlayerWithNumber(number: 4)
    }
    
    private func makePlayerWithNumber(number:Int) -> [Player] {
        var players:[Player] = []
        for _ in 0..<number {
            let player = makePlayer()
            players.append(player)
        }
        return players
    }
    
    //MARK: -- 랜덤한 이름을 가지고 Player를 만드는 함수들.
    
    private func makePlayer() -> Player {
        let name = makeName()
        return Player(name: name)
    }
    
    private func makeName() -> String {
        let stringSource = "abcdefghijklmnopqrstuvwxyz"
        return selectRandomStringElement(sourceString: stringSource, length: 5)
    }
    
    private func selectRandomStringElement(sourceString:String, length:Int) -> String {
        var selectedString:String = ""
        for _ in 0..<length {
            let randomString = sourceString.randomElement() ?? " "
            selectedString.append(randomString)
        }
        return selectedString
    }
}


