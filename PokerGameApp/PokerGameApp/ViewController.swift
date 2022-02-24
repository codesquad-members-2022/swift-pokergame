import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studSelectionControl: UISegmentedControl!
    @IBOutlet weak var playerCountSelectionControl: UISegmentedControl!
    private var pokerGame: PokerGame?
    private var cardImageViews: [UIImageView] = []
    private var labels: [UILabel] = []
    
    @IBAction func studOptionSelected(_ sender: UISegmentedControl) {
        setPokerGame()
    }
    
    @IBAction func playerCountSelected(_ sender: UISegmentedControl) {
        setPokerGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        //setInitialImageView(7)
        setPokerGame()
        setStudSelectionControl()
        setPlayerCountSelectionControl()
    }
    
    func setBackgroundColor(){
        if let patternImage = UIImage(named: "bg_pattern"){
            self.view.backgroundColor = UIColor.init(patternImage: patternImage)
        }
    }
    
    func setStudSelectionControl(){
        playerCountSelectionControl.center.x = self.view.center.x
        playerCountSelectionControl.center.y = self.view.center.y * CGFloat(0.2)
        for index in 0..<PokerGame.Count.allCases.count{
            playerCountSelectionControl.setTitle("\(PokerGame.Count.allCases[index].rawValue)명", forSegmentAt: index)
        }
    }
    
    func setPlayerCountSelectionControl(){
        studSelectionControl.center.x = self.view.center.x
        studSelectionControl.center.y = self.view.center.y * CGFloat(0.35)
        for index in 0..<PokerGame.Stud.allCases.count{
            studSelectionControl.setTitle("\(PokerGame.Stud.allCases[index].rawValue) Cards", forSegmentAt: index)
        }
    }
    
    func setPokerGame(){
        let selectedCount = PokerGame.Count.allCases[playerCountSelectionControl.selectedSegmentIndex]
        let selectedStud = PokerGame.Stud.allCases[studSelectionControl.selectedSegmentIndex]
        
        self.pokerGame = PokerGame(numberOfPlayers: selectedCount, stud: selectedStud)
        if let _ = self.pokerGame{
            self.pokerGame?.start()
            setAllImageViewsAndLabels()
        }
    }
    
    func setAllImageViewsAndLabels(){
        
        guard let game = self.pokerGame else { return }
        
        removePreviousCardImageViewsAndLabels()
        
        let cardsCount = CGFloat(game.stud.rawValue)
        let cardMargin = CGFloat(20)
        let cardWidth = (self.view.bounds.width)/(cardsCount+1)
        let cardHeight = cardWidth*CGFloat(1.27)
        var cardXPosition = cardMargin
        var cardYPosition = CGFloat(studSelectionControl.center.y * 1.3)
        
        var users: [Player] = game.players
        users.append(game.dealer)
        
        for user in users{
            
            let label: UILabel = UILabel()
            label.frame = CGRect(x: cardMargin, y: cardYPosition, width: 200, height: 30)
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = UIColor.white
            label.text = user.name
            self.view.addSubview(label)
            self.labels.append(label)
            cardYPosition += label.frame.height
            
            for card in user.cards{
                guard let image = UIImage(named: "\(card.description)") else { continue }
                let imageView: UIImageView = UIImageView(frame: CGRect(x: cardXPosition, y: cardYPosition, width: cardWidth, height: cardHeight))
                imageView.image = image
                imageView.contentMode = .scaleAspectFit
                self.view.addSubview(imageView)
                self.cardImageViews.append(imageView)
                cardXPosition += cardWidth - CGFloat(10)
            }
            cardXPosition = cardMargin
            cardYPosition += cardHeight + CGFloat(10)
        }
    }
    
    private func removePreviousCardImageViewsAndLabels(){
        for imageView in self.cardImageViews{
            imageView.removeFromSuperview()
        }
        self.cardImageViews = []

        for label in self.labels{
            label.removeFromSuperview()
        }
        self.labels = []
    }
    
    func setInitialImageView(_ cardsCount: CGFloat){
        guard let image = UIImage(named: "card-back") else{ return }
        let cardMargin = CGFloat(10)
        let cardWidth = (self.view.bounds.width - cardMargin*(cardsCount+1))/cardsCount
        let cardHeight = cardWidth*CGFloat(1.27)
        var cardXPosition = cardMargin
        let cardYPosition = CGFloat(80)
        
        for _ in 0..<Int(cardsCount){
            let imageView: UIImageView = UIImageView(frame: CGRect(x: cardXPosition, y: cardYPosition, width: cardWidth, height: cardHeight))
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            self.view.addSubview(imageView)
            cardXPosition += cardMargin+cardWidth
        }
        
    }
}

