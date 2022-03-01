//
//  ViewController.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var variant: UISegmentedControl!
    @IBOutlet weak var entries: UISegmentedControl!
    @IBOutlet weak var playButton: UIButton!
    
    private var variantValue: PockerGame.Variants{
        return PockerGame.Variants.allCases[variant.selectedSegmentIndex]
    }
    private var entriesValue: PockerGame.Entries{
        return PockerGame.Entries.allCases[entries.selectedSegmentIndex]
    }
    
    private var dealerViewController: DealerViewController?
    private var playersViewController: PlayersViewController?
    
    private var showNextTurnButton: Bool = false
    private var pockerGame: PockerGame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pockerGame = PockerGame(variant: variantValue, entries: entriesValue)
        
        if let pattern = UIImage(named: "bg_pattern"){
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }
        
        callPlayerViewController()
        giveVariantValueToPlayerVC()
        
        callDealerViewController()
        giveVariantValueToDealerVC()
    }
    
    func callPlayerViewController(){
        guard let playerView = self.storyboard?.instantiateViewController(withIdentifier: "PlayersViewController") as? PlayersViewController else{
            return
        }
        
        self.playersViewController = playerView
        
        if let players = pockerGame?.entryPlayers(){
            self.playersViewController?.getPlayersInstance(players: players)
        } else{
            return
        }
    }
    
    func callDealerViewController(){
        guard let dealerView = self.storyboard?.instantiateViewController(withIdentifier: "DealerViewController") as? DealerViewController else{
            return
        }
        
        self.dealerViewController = dealerView
        
        if let dealer = pockerGame?.entryDealer(){
            self.dealerViewController?.getDealerInstance(dealer: dealer)
        } else{
            return
        }
    }
    
    func giveVariantValueToPlayerVC(){
        guard let playerView = self.storyboard?.instantiateViewController(withIdentifier: "PlayersViewController") as? PlayersViewController else{
            return
        }
        
        playerView.getVariantValue(variant: self.variantValue)
    }
    
    func giveVariantValueToDealerVC(){
        guard let dealerView = self.storyboard?.instantiateViewController(withIdentifier: "DealerViewController") as? DealerViewController else{
            return
        }
        
        dealerView.getVariantValue(variant: self.variantValue)
    }
    
    func playGame(){
        guard let pockerGame = pockerGame else {
            return
        }
        
        let _ = pockerGame.dealerShuffle()
    }
    
    func divideCards(){
        pockerGame?.divideCards()
        playersViewController?.makeUIImage()
        dealerViewController?.makeUIImage()
    }
    
    func replayGame(){
        showNextTurnButton = false
        playButton.setTitle("Play", for: .normal)
        
        pockerGame?.clearGame()
        let _ = pockerGame?.dealerShuffle()
        
        dealerViewController?.removeLabelStackView()
        playersViewController?.removeLabelStackView()
        
        dealerViewController?.addLabelStackView()
        dealerViewController?.addLabelStackView()
    }
    
    @IBAction func variantControllClick(_ sender: Any) {
        pockerGame?.changeVariant(variant: variantValue)
        dealerViewController?.getVariantValue(variant: variantValue)
        playersViewController?.getVariantValue(variant: variantValue)
        
        dealerViewController?.removeLabelStackView()
        playersViewController?.removeLabelStackView()
        
        dealerViewController?.addLabelStackView()
        dealerViewController?.addLabelStackView()
        
        showNextTurnButton = false
        playButton.setTitle("Play", for: .normal)
    }
    
    @IBAction func entriesControllClick(_ sender: Any) {
        pockerGame = PockerGame(variant: variantValue, entries: entriesValue)
        dealerViewController?.getEntriesValue(entries: entriesValue)
        playersViewController?.getEntriesValue(entries: entriesValue)
        
        dealerViewController?.removeLabelStackView()
        playersViewController?.removeLabelStackView()
        
        dealerViewController?.addLabelStackView()
        dealerViewController?.addLabelStackView()
        
        showNextTurnButton = false
        playButton.setTitle("Play", for: .normal)
    }
    
    @IBAction func play(_ sender: Any) {
        if showNextTurnButton{
            playGame()
            showNextTurnButton.toggle()
        } else{
            guard let cardsCount = pockerGame?.entryDealer().showMyCards().count else{
                return
            }
            playButton.setTitle("Dividing", for: .normal)
            
            if cardsCount < variantValue.caseNumber() - 1{
                divideCards()
            } else if cardsCount == variantValue.caseNumber() - 1{
                divideCards()
                playButton.setTitle("ReGame", for: .normal)
            } else{
                replayGame()
            }
        }
    }
    
    @IBAction func resetGame(_ sender: Any) {
        replayGame()
    }
}
