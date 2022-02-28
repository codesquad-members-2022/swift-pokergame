import Foundation

class Players: CustomStringConvertible{
    
    internal enum Count: Int, CaseIterable{
        case two = 2
        case three = 3
        case four = 4
        
        func creatingLoop(loop: ()->Void){
            for _ in 0..<self.rawValue{
                loop()
            }
        }
    }
    
    private var randomNames = ["dale","eddy","jee","foucault","sol"]
    private var players: [Player] = []
    var count: Int{
        return players.count
    }
    var description: String{
        return players.description
    }
    
    init(numberOfPlayers: Count){
        createPlayers(numberOfPlayers: numberOfPlayers)
    }
    
    func createPlayers(numberOfPlayers: Count){
        numberOfPlayers.creatingLoop {
            guard let playerName = randomNames.popLast() else { return }
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
