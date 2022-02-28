import Foundation

class Players: CustomStringConvertible{
    private var players: [Player] = []
    var count: Int{
        return players.count
    }
    var description: String{
        return players.description
    }
    
    init(creatingLoop: ()->[Player]){
        for player in creatingLoop(){
            self.players.append(player)
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
