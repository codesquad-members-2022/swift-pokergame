import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        setInitialImageView(7)
        testCardPrinting()
    }
    
    func setBackgroundColor(){
        if let patternImage = UIImage(named: "bg_pattern"){
            self.view.backgroundColor = UIColor.init(patternImage: patternImage)
        }
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
    
    func testCardPrinting(){
        for cardNumber in 1...13{
            let randomIndex = Int.random(in: 0...3)
            if let card = Card(cardSuitindex: randomIndex, cardNumber: cardNumber){
                printCard(card)
            }
        }
    }
    
    func printCard(_ card: Card){
        print(card)
    }
}

