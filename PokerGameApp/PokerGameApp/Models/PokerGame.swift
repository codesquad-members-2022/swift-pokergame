//
//  PokerGame.swift
//  포커게임
//
//  Created by Kai Kim on 2022/02/25.
//

import Foundation
struct PokerGame {

    //게임이 생성되면 한명의 딜러는 자동 으로 카드 덱과 생성된다.
    //XCTest 하기 위해 외부에서 읽기만 가능하고 내부에서만 수정이 가능하도록  private (set) 설정.
    private(set) var dealer = Dealer()
    private var gameDeck = Deck()
    //딜러를 포함한 플레이어 리스트
    private(set) var players = [Person]()
    
    //플레이어수 (딜러 미포함)
    var numberOfGuest : NumberOfGuest
    var gameMode : GameMode
    
    //게임 플레이 횟수
    private var numberOfSet = 1
    
    init(numberOfGuest : NumberOfGuest , mode : GameMode){
        self.numberOfGuest = numberOfGuest
        self.gameMode = mode
    }
    
    mutating func run() {
        setUp()
        while true {
            playOneSet()
            showAllCards()
            resetPlayerCards()
        }
    }

    //나중 스텝에 게임 관련 세팅작업이 필요할경우를 위해 setUp 번들 을 만들어줌.
    //외부에서 setup 메소드를 은닉화 시키고 현재 하위 메소드인 setTotalPlayers() 를 public 으로 지정하여서
    //XCTest 진행 가능하게 만들었다.
    private mutating func setUp() {
        self.players = setPlayers()
    }
    
    //세팅된 딜러 와 플레이어 의 수만큼 playerList 에 넣어준다.
    //public 으로 지정하여서 XCTest 진행 가능하게 만들었다.
    func setPlayers() -> [Person] {
        var totalPlayers = [Person]()
        let roster = Roster.allCases.map{$0}
        for i in 0..<numberOfGuest.rawValue {
            totalPlayers.append(Person(name: roster[i]))
        }
        totalPlayers.append(dealer)
        
        return totalPlayers
    }
    
    //딜러가 카드를 gameMode 에 맞게 플레이어들에게 나누어준다.
    private mutating func playOneSet() {
        do{
            dealer.shuffleDeck(gameDeck)
            for _ in 0..<gameMode.rawValue {
                for player in players {
                    try dealer.dealCard(to: player, from: gameDeck)
                }
            }
            self.numberOfSet += 1
        } catch {
            switch error {
            case Errors.InsufficientCard :
                print(Errors.InsufficientCard.rawValue)
                exit(1)
            default :
                print("unknown error occurred")
            }
        }
    }
    
    func getGameMode () -> GameMode {
        return self.gameMode
    }
    
    func getNumberOfPlayers() -> Int {
        return self.players.count
    }
    
    func getNumberOfSet() -> Int {
        return self.numberOfSet
    }
        
    private func showAllCards() {
        for player in players {
            print(player)
        }
    }
    
    private func resetPlayerCards() {
        for player in players {
            player.resetCards()
        }
    }

    enum Roster : String,CaseIterable {
        case Kai
        case Tim
        case Luan
        case Hana
        case Dealer
    }
    enum NumberOfGuest : Int{
        case One = 1
        case Two
        case Three
        case Four
    }
    enum GameMode :Int {
        case SevenStud = 7
        case FiveStud = 5
    }
    enum Errors : String, Error {
        case InsufficientCard = "-카드가 부족해 더이상 게임 진행 불가능 합니다-"
    
    }

    
}


