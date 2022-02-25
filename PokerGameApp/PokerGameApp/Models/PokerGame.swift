//
//  PokerGame.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/25.
//

import Foundation
struct PokerGame {
    
    //게임이 시작되면 한명의 딜러는 자동 으로 생성됨.
    private let dealer = Dealer(gameDeck: Deck())
    private let playerList = [Player]()
    //한게임의 자리 여유
    private let maxSit = 4
    
    func setUp() {
        
    }
    
    func run() {
        print(InputView.Messages.openingMessage)
        setUp()
        do{

            try dealer.dealCard(to: playerList[0])
            
        }catch {
            switch error {
                case Errors.insufficientCard :
                    print(Errors.insufficientCard.rawValue)
                    exit(1)
                default :
                    print("unknown error occurred")
                
            }
        }
        
    }
    
    
    enum GameMode {
        case sevenStud
        case fiveStud
    }
    enum Errors : String, Error {
        case insufficientCard
    }

    
}

//Module for displaying Welcome messeage and responses to input questions
struct InputView {
    
    enum Messages : String{
        case openingMessage = "Poker Game 이 열렸습니다!"
        case queryForParticipate = "게임에 참가 하실분 계십니까? (Yes/No)"
        case gameModeInstruction = "게임 방식을 선택해주세요. (7 stud -> 입력:7, 5 stud -> 입력:5)"
    }
    
    //Custom read method
    static func read(prompt: String) -> String {
        print("> \(prompt)")
        return readLine() ?? ""
    }
    
    
    //Ask if there are people who wants to play the game
    static func gatherPlayer() -> Bool?{
        let response = read(prompt: Messages.queryForParticipate.rawValue)
        switch response.lowercased() {
        case "yes":
            return true
        case "no":
            return false
        default :
            //다른 입력일경우 다시 물어봐야함.
            return nil
        }
    }
    
    static func selectGameMode() -> PokerGame.GameMode? {
        let response = read(prompt: Messages.gameModeInstruction.rawValue)
        switch Int(response){
        case 5:
            return .fiveStud
        case 7:
            return .sevenStud
        default :
            //다른 입력일경우 다시 물어봐야함.
            return nil
        }
    }
    
    
}

