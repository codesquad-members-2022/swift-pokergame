import Foundation

class Player: CustomStringConvertible{
    private var name: String
    var playerName: String{
        return self.name
    }
    fileprivate (set) var cards: [Card] = []
    var description: String{
        return "\(name) \(cards)"
    }
    
    init(name: String){
        self.name = name
    }
    
    func addCard(_ card: Card){
        self.cards.append(card)
    }
}

class Dealer: Player{

    init() {
        super.init(name: "딜러")
    }
    
    func handOutCard(stud: Int)-> Card?{
        guard let card = self.cards.popLast() else { return nil }
        return card
    }
}
