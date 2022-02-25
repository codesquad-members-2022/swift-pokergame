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
    
    
    private (set) var stud: Stud
    private (set) var deck: CardDeck
    var dealer: Dealer
    var players: Players?
    var description: String{
        return "\(players)\(dealer)"
    }
    
    init(numberOfPlayers: Count, stud: Stud){
        self.stud = stud
        self.dealer = Dealer()
        self.deck = CardDeck()
        self.players = Players(numberOfPlayers: numberOfPlayers)
    }
        
    func start(){
        deck.shuffle()
        run()
    }
    
    private func run(){
        guard let players = self.players else { return }
        
        if(isNumberOfCardsEnough()){
            self.deck = dealer.takeOutAllNecessaryCards(deck: self.deck, count: (players.count + 1) * stud.rawValue)
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
                guard let card = dealer.takeOutCard() else { continue }
                players.addCard(playerIndex: index, card: card)
            }
        }
    }
}
