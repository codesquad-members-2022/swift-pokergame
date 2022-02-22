import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        setInitialImageView(7)
        //testCardPrinting()
        testCardDeckCreation()
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
        for cardNumberIndex in 0..<12{
            let cardSuitIndex = Int.random(in: 0...3)
            let card = Card(suit: Card.Suit.allCases[cardSuitIndex], number: Card.Number.allCases[cardNumberIndex])
            printCard(card)
        }
    }
    
    func printCard(_ card: Card){
        print(card)
    }
    
    func testCardDeckCreation(){
        var deck: CardDeck = CardDeck()
        let commands: [String] = ["reset","shuffle","remove","remove","shuffle","reset","remove","shuffle","remove","exit"]
        for command in commands{
            print(command)
            switch command{
            case "reset":
                deck.reset()
                print("카드 전체를 초기화했습니다.\n총 \(deck.count)장의 카드가 있습니다.")
            case "shuffle":
                deck.shuffle()
                print("전체 \(deck.count)장의 카드를 섞었습니다.")
            case "remove":
                print("\(deck.removeOne())\n총 \(deck.count)장의 카드가 남아있습니다.")
            default:
                print("테스트 종료")
                break
            }
        }
    }
}

