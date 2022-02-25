import Foundation

class Players: CustomStringConvertible{
    
    private (set) var players: [Player] = []
    var count: Int{
        return players.count
    }
    var description: String{
        return players.reduce(into: "", { $0 += $1.description+"\n"})
    }
    
    init(players: [Player]){
        self.players = players
    }
    
    func addPlayer(_ player: Player){
        self.players.append(player)
    }
    
    func addCard(playerIndex: Int, card: Card){
        self.players[playerIndex].addCard(card)
    }
    
}
