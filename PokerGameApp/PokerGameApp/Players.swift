import Foundation

class Players: CustomStringConvertible{
    
    private var randomNames = ["dale","eddy","jee","foucault","sol"]
    private var players: [Player] = []
    private let numberOfPlayers: PokerGame.Count
    var count: Int{
        return players.count
    }
    var description: String{
        return players.description
    }
    
    init(numberOfPlayers: PokerGame.Count){
        self.randomNames.shuffle()
        self.numberOfPlayers = numberOfPlayers
        createPlayers()
    }
        
    func createPlayers(){
        for _ in 0..<numberOfPlayers.rawValue{
            guard let playerName = randomNames.popLast() else { continue }
            players.append(Player(name: playerName))
        }

    }
    
    func addPlayer(_ player: Player){
        self.players.append(player)
    }
    
    func getIterator(additionalPlayer: Player?) -> IndexingIterator<[Player]>{
        var playersCopy = self.players
        if let additionalPlayer = additionalPlayer{
            playersCopy.append(additionalPlayer)
        }
        return playersCopy.makeIterator()
    }
    
}
