import Foundation

class PockerGame: CustomStringConvertible{

    internal class Player: CustomStringConvertible{
        var name: String
        var cards: [Card] = []
        var description: String{
            return "\(name) \(cards)"
        }
        
        init(_ name: String){
            self.name = name
        }
    }

    internal class Dealer: Player{
        
        init() {
            super.init("딜러")
        }
        
        func handOutCards(stud: Int)-> [Card]{
        
            return []
        }
    }
    
    private var randomNames = ["dale","eddy","jee","foucault","sol"]
    private var stud: Int
    private var deck: CardDeck
    private var dealer: Dealer
    private var players: [Player] = []
    var description: String{
        let value: String = players.reduce(into: "", { $0 += $1.description+"\n"})
        return "\(value)\(dealer)"
    }
    
    init(numberOfPlayers: Int, stud: Int){
        self.stud = stud
        self.dealer = Dealer()
        self.deck = CardDeck()
        for _ in 0..<numberOfPlayers{
            guard let playerName = randomNames.popLast() else { continue }
            players.append(Player(playerName))
        }
    }
    
    func start(){
        deck.shuffle()
        run()
    }
    
    private func run(){
        if(deck.count >= (players.count + 1) * stud){
            handOutCards()
        }
    }
    
    private func handOutCards(){
        for index in 0..<players.count{
            for _ in 0..<stud{
                guard let card = deck.removeOne() else { continue }
                players[index].cards.append(card)
            }
        }
    }
}
