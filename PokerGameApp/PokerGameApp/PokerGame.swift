import Foundation

class PokerGame: CustomStringConvertible{    
    
    internal enum Stud: Int, CaseIterable{
        case five = 5
        case seven = 7
    }
    
    private (set) var stud: Stud
    private (set) var deck: CardDeck
    var dealer: Dealer
    var players: Players
    var description: String{
        return "\(players)\(dealer)"
    }
    
    init(numberOfPlayers: Players.Count, stud: Stud){
        self.stud = stud
        self.deck = CardDeck()
        self.dealer = Dealer(deck: self.deck)
        self.players = Players(numberOfPlayers: numberOfPlayers)
    }
        
    func start(){
        deck.shuffle()
        run()
    }
    
    private func run(){
        if(isNumberOfCardsEnough()){
            distributeCards()
        }
    }
    
    private func isNumberOfCardsEnough()-> Bool{
        return deck.count >= (players.count + 1) * stud.rawValue
    }
    
    private func distributeCards(){
        
        for _ in 0..<stud.rawValue{
            var playerIterator = self.players.getIterator(additionalPlayer: self.dealer)
            while let player = playerIterator.next(){
                guard let card = dealer.takeOutCard() else { continue }
                player.addCard(card)
            }
        }
    }
}
