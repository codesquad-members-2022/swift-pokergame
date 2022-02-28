import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var studSelectionControl: UISegmentedControl!
    @IBOutlet weak var playerCountSelectionControl: UISegmentedControl!
    private var pokerGame: PokerGame?
    private var cardImageViews: [UIImageView] = []
    private var labels: [UILabel] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBAction func studOptionSelected(_ sender: UISegmentedControl) {
        setPokerGame()
    }
    
    @IBAction func playerCountSelected(_ sender: UISegmentedControl) {
        setPokerGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        setPokerGame()
        setStudSelectionControl()
        setPlayerCountSelectionControl()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        setPokerGame()
    }
    
    func setBackgroundColor(){
        if let patternImage = UIImage(named: "bg_pattern"){
            self.view.backgroundColor = UIColor.init(patternImage: patternImage)
        }
    }
    
    func setStudSelectionControl(){
        playerCountSelectionControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: UIControl.State.normal)
        playerCountSelectionControl.selectedSegmentTintColor = UIColor.lightText
        playerCountSelectionControl.center.x = self.view.center.x
        playerCountSelectionControl.center.y = self.view.center.y * CGFloat(0.2)
        for index in 0..<Players.Count.allCases.count{
            playerCountSelectionControl.setTitle("\(Players.Count.allCases[index].rawValue)명", forSegmentAt: index)
        }
    }
    
    func setPlayerCountSelectionControl(){
        studSelectionControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: UIControl.State.normal)
        studSelectionControl.selectedSegmentTintColor = UIColor.lightText
        studSelectionControl.center.x = self.view.center.x
        studSelectionControl.center.y = self.view.center.y * CGFloat(0.3)
        for index in 0..<PokerGame.Stud.allCases.count{
            studSelectionControl.setTitle("\(PokerGame.Stud.allCases[index].rawValue) Cards", forSegmentAt: index)
        }
    }
    
    func setPokerGame(){
        let selectedCount = Players.Count.allCases[playerCountSelectionControl.selectedSegmentIndex]
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
        let initialXPosition = CGFloat(30)
        let cardWidth = (self.view.bounds.width)/(cardsCount+0.6)
        let cardHeight = cardWidth*CGFloat(1.27)
        var cardXPosition = initialXPosition
        var cardYPosition = CGFloat(studSelectionControl.center.y * 1.2)
        
        var playerIterator = game.players.getIterator(additionalPlayer: game.dealer)
        while let player = playerIterator.next(){
            
            let label = createUserNameLabel(name: player.currentName, x: initialXPosition, y: cardYPosition)
            self.view.addSubview(label)
            self.labels.append(label)
            cardYPosition += label.frame.height
            
            var cardIterator = player.getCardsIterator()
            while let card = cardIterator.next() {
                guard let image = UIImage(named: "\(card.description)") else { continue }
                let imageView = createCardImageView(image: image, x: cardXPosition, y: cardYPosition, width: cardWidth, height: cardHeight)
                self.view.addSubview(imageView)
                self.cardImageViews.append(imageView)
                cardXPosition += cardWidth - CGFloat(10)
            }
            cardXPosition = initialXPosition
            cardYPosition += cardHeight + CGFloat(10)
        }
    }
    
    private func createUserNameLabel(name: String, x: CGFloat, y: CGFloat) -> UILabel{
        let label: UILabel = UILabel()
        label.frame = CGRect(x: x, y: y, width: 200, height: 30)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.text = name
        return label
    }
    
    private func createCardImageView(image: UIImage, x:CGFloat, y:CGFloat, width: CGFloat, height:CGFloat) -> UIImageView{
        let imageView: UIImageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
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

}

