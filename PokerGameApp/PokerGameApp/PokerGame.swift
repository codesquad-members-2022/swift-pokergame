import Foundation

class PokerGame: CustomStringConvertible{
    
    internal enum Count: Int, CaseIterable{
        case two = 2
        case three = 3
        case four = 4
    }
    
    internal enum Stud: Int, CaseIterable{
        case five = 5
        case seven = 7
    }
    
    private var randomNames = ["dale","eddy","jee","foucault","sol"]
    private (set) var stud: Stud
    private (set) var deck: CardDeck
    var dealer: Dealer
    //var players: [Player] = []
    var players: Players?
    var description: String{
        return "\(players)\(dealer)"
    }
    
    init(numberOfPlayers: Count, stud: Stud){
        self.stud = stud
        self.dealer = Dealer()
        self.deck = CardDeck()
        self.players = createPlayers(numberOfPlayers: numberOfPlayers)
    }
    
    private func createPlayers(numberOfPlayers: Count)-> Players{
        var players: [Player] = []
        self.randomNames.shuffle()
        for _ in 0..<numberOfPlayers.rawValue{
            guard let playerName = randomNames.popLast() else { continue }
            players.append(Player(name: playerName))
        }
        return Players(players: players)
    }
    
    func start(){
        deck.shuffle()
        run()
    }
    
    private func run(){
        guard let players = self.players else { return }
        
        if(isNumberOfCardsEnough()){
            for _ in 0..<(players.count + 1) * stud.rawValue{
                guard let card = deck.removeOne() else { continue }
                dealer.addCard(card)
            }
            distributeCards()
        }
    }
    
    private func isNumberOfCardsEnough()-> Bool{
        guard let players = self.players else { return false }
        
        return deck.count >= (players.count + 1) * stud.rawValue
    }
    
    private func distributeCards(){
        guard let players = self.players else { return }
        
        for _ in 0..<stud.rawValue{
            for index in 0..<players.count{
                guard let card = dealer.handOutCard(stud: stud.rawValue) else { continue }
                players.addCard(playerIndex: index, card: card)
            }
        }
    }
}
