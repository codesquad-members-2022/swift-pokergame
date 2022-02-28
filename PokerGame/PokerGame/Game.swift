//
//  PlayersFactory.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/25.
//

import Foundation

public class Game {
    
    private var players:Players
    private var dealer:Dealer

    init(dealer:Dealer, players:Players) {
        self.dealer =  dealer
        self.players = players
    }
    
    //딜러가 더이상 카드를 돌릴 수 없을때에는 Game에 정의된 게임의 상태를 String으로 반환하는 함수를 리턴하도록 해보았습니다.
    //성공 혹은 에러를 뿜기 때문에 GameStatus라는 Enum타입을 하나더 정의했습니다.
    func start() -> String {
        if dealer.dealTheCards(players: players) {
            return GameStatus.successedCase(results).status
        }
        return GameStatus.errorCase.status
    }
    
    
    //총 결과
    func results() -> String {
        return "\(showPlayerRanks())\n\(showPlayerCards())"
    }
    
    //Player들의 Rank들만 볼것인지 Card들만 볼것인지 옵션을 주려 선언했습니다.
    func showPlayerRanks() -> String{
        return players.WholeNamesAndResults()
    }
    
    func showPlayerCards() -> String {
        players.wholePlayerCards()
    }
}




