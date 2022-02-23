import Foundation

class PockerGame: CustomStringConvertible{

    internal class Player: CustomStringConvertible{
        var name: String
        fileprivate (set) var cards: [Card] = []
        var description: String{
            return "\(name) \(cards)"
        }
        
        init(_ name: String){
            self.name = name
        }
        
        func getCard(_ card: Card){
            self.cards.append(card)
        }
        
        func getCards(_ cards: [Card]){
            self.cards.append(contentsOf: cards)
        }
    }

    internal class Dealer: Player{

        init() {
            super.init("딜러")
        }
        
        func handOutCard(stud: Int)-> Card?{
            guard let card = self.cards.popLast() else { return nil }
            return card
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
            for _ in 0..<(players.count + 1) * stud{
                guard let card = deck.removeOne() else { continue }
                dealer.getCard(card)
            }
            distributeCards()
        }
    }
    
    private func distributeCards(){
        for _ in 0..<stud{
            for index in 0..<players.count{
                guard let card = dealer.handOutCard(stud: stud) else { continue }
                players[index].getCard(card)
            }
        }
    }
}
