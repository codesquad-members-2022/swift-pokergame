import Foundation

class Players: CustomStringConvertible{
    
    private var randomNames = ["dale","eddy","jee","foucault","sol"]
    private var players: [Player] = []
    var count: Int{
        return players.count
    }
    var description: String{
        return players.description
    }
    
    init(numberOfPlayers: Int){
        self.randomNames.shuffle()
        createPlayers(numberOfPlayers: numberOfPlayers)
    }
        
    func createPlayers(numberOfPlayers: Int){
        for _ in 0..<numberOfPlayers{
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
