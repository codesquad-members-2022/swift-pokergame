//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var algorithmControl: UISegmentedControl!
    
    private var cards: [UIImageView]!
    
    private var readableFrame: CGRect!
    
    private var endOfRange: UITextRange? {
        logTextView.textRange(from: logTextView.endOfDocument, to: logTextView.endOfDocument)
    }
    
    private let poker = PokerGame()
    private var dealerDeck: CardDeck { poker.dealer.deck }
    private var dealerSkill: ShuffleAlgorithm<Card> { poker.dealer.shuffleSkill }
    private var selectedAlgorithm: ((inout [Card]) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logTextView.delegate = self
        
        if let bgPattern = UIImage.init(named: "bg_pattern") {
            self.view.backgroundColor = UIColor.init(patternImage: bgPattern)
        }
        
        poker.drawCardsToAllMembers()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        let CARD_COUNT = 5
        
        readableFrame = self.view.readableContentGuide.layoutFrame
        let totalRow: Int = (CARD_COUNT / 7) + (CARD_COUNT % 7 > 0 ? 1 : 0)
        
        for i in 1...totalRow {
            if i == totalRow {
                setStackView(cardNumber: (totalRow == 1 ? CARD_COUNT : 7 % CARD_COUNT))
            } else {
                setStackView(cardNumber: 7)
            }
        }
    }
    
    func setStackView(cardNumber: Int) {
        let CARD_INSET: CGFloat = 3
        let cardWidth = (readableFrame.width / CGFloat(7)) - CARD_INSET
        
        cards = (0..<cardNumber).compactMap { _ in
            let imageView = UIImageView(image: UIImage(named: "card-back"))
            imageView.contentMode = .scaleAspectFit
            return imageView
        }
        
        let stackView = UIStackView.init(arrangedSubviews: cards)
        self.view.addSubview(stackView)
        
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = CARD_INSET
        stackView.frame = CGRect(origin: readableFrame.origin, size: CGSize(width: readableFrame.width, height: cardWidth * 1.27))
    }
    
    @IBAction func algorithmControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: selectedAlgorithm =
            dealerSkill.fisherYatesAlgorithm
        case 1: selectedAlgorithm =
            dealerSkill.knuthAlgorithm
        default: selectedAlgorithm =
            dealerSkill.ordinaryCardShuffle
        }
    }
    
    @IBAction func countButtonTouchUpInside(_ sender: UIButton) {
        setLog(text: "> 카드의 총 갯수\n총 \(dealerDeck.count())장의 카드가 있습니다.\n")
    }
    
    @IBAction func shuffleButtonTouchUpInside(_ sender: UIButton) {
        poker.dealer.shuffle()
        setLog(text: "> 카드 섞기(\(poker.dealer.shuffleType.rawValue))\n전체 \(dealerDeck.count())장의 카드를 섞었습니다.\n")
    }
    
    @IBAction func removeOneButtonTouchUpInside(_ sender: UIButton) {
        let card = poker.dealer.deck.removeOne()
        
        var text = "> 카드 하나 뽑기\n"
        text += "\(card != nil ? String(describing: card!) : "카드가 존재하지 않습니다.")\n총 \(dealerDeck.count())장의 카드가 남아있습니다.\n"
        setLog(text: text)
    }
    
    @IBAction func resetButtonTouchUpInside(_ sender: UIButton) {
        poker.dealer.deck.reset()
        setLog(text: "> 카드 초기화\n총 \(poker.dealer.deck.count())장의 카드가 남아있습니다.\n")
    }
    
    private func alert(with message: String) {
        UIAlertController.alert(with: "값은 아래와 같습니다", at: self)
    }
    
    private func setLog(text: String) {
        if let endOfRange = logTextView.textRange(from: logTextView.endOfDocument, to: logTextView.endOfDocument) {
            logTextView.replace(endOfRange, withText: text)
        }
    }
}

extension UIAlertController {
    static func alert(with title: String, at viewController: UIViewController, cancelMessage: String? = nil) {
        let alert = UIAlertController.init(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction.init(title: cancelMessage ?? "닫기", style: .destructive) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        
        viewController.show(alert, sender: nil)
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        textView.text += "\n"
        
        textView.scrollRectToVisible(
            CGRect(origin: textView.contentOffset, size: textView.contentSize),
            animated: true
        )
    }
}

enum TypeOfGame {
    case SevenStudPoker
    case FiveStudPoker
    case NotGameCard
    
    var cardCount: Int? {
        switch self {
        case .SevenStudPoker:
            return 7
        case .FiveStudPoker:
            return 5
        default:
            return nil
        }
    }
}
