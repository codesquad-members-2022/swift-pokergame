//
//  Player.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/25.
//

//각 플레이어가 카드를 받을때마다 rankOfHands(족보)를 바꾸어주어야 하기 때문에 class로 선언했습니다.
class Player {
    
    let name:String                                     //이름은 한번 정해지면 바뀌지 않지만, 후에 카드게임에서 승자를 가릴때 이름을 가지고 와야하므로 private가아닌 let으로 선언했습니다.
    private var rankOfHand:RankOfHands = .highCard
    private(set) var cards:[Card] = []                  //뽑은 카드들은 내부에서만 변경가능하고, 후에 게임 결과를 출력할때 필요하므로 private(set)으로 선언했습니다.
    
    init(name:String) {
        self.name = name
    }
    
    //패를 확인.
    func checkRankOfHand() -> RankOfHands {
        return self.rankOfHand
    }
    
    func addCard(card:Card) {
        cards.append(card)
    }
    
    func resetCards() {
        self.cards.removeAll()
    }
}
