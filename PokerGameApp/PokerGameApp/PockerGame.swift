import Foundation

class PockerGame: CustomStringConvertible{
    
    internal enum Count: Int{
        case one = 1
        case two = 2
        case three = 3
        case four = 4
    }
    
    internal enum Stud: Int{
        case five = 5
        case seven = 7
    }

    internal class Player: CustomStringConvertible{
        var name: String
        fileprivate (set) var cards: [Card] = []
        var description: String{
            return "\(name) \(cards)"
        }
        
        init(_ name: String){
            self.name = name
        }
        
        func addCard(_ card: Card){
            self.cards.append(card)
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
    private (set) var stud: Stud
    private (set) var deck: CardDeck
    var dealer: Dealer
    var players: [Player] = []
    var description: String{
        let value: String = players.reduce(into: "", { $0 += $1.description+"\n"})
        return "\(value)\(dealer)"
    }
    
    init(numberOfPlayers: Count, stud: Stud){
        self.stud = stud
        self.dealer = Dealer()
        self.deck = CardDeck()
        self.players = createPlayers(numberOfPlayers)
    }
    
    private func createPlayers(_ numberOfPlayers: Count)-> [Player]{
        var players: [Player] = []
        for _ in 0..<numberOfPlayers.rawValue{
            guard let playerName = randomNames.popLast() else { continue }
            players.append(Player(playerName))
        }
        return players
    }
    
    func start(){
        deck.shuffle()
        run()
    }
    
    private func run(){
        if(isNumberOfCardsEnough()){
            for _ in 0..<(players.count + 1) * stud.rawValue{
                guard let card = deck.removeOne() else { continue }
                dealer.addCard(card)
            }
            distributeCards()
        }
    }
    
    private func isNumberOfCardsEnough()-> Bool{
        return deck.count >= (players.count + 1) * stud.rawValue
    }
    
    private func distributeCards(){
        for _ in 0..<stud.rawValue{
            for index in 0..<players.count{
                guard let card = dealer.handOutCard(stud: stud.rawValue) else { continue }
                players[index].getCard(card)
            }
        }
    }
}
