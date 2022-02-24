import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studSelectionControl: UISegmentedControl!
    @IBOutlet weak var playerCountSelectionControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        //setInitialImageView(7)
        setGameOptionButtons()
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
    
    func setGameOptionButtons(){
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

