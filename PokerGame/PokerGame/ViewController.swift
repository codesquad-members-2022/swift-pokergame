//
//  ViewController.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: card들 imageView 만들기
    let card0:UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.backImageOfCard
        return imageView
    }()
    
    let card1:UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.backImageOfCard
        return imageView
    }()
    
    let card2:UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.backImageOfCard
        return imageView
    }()
    
    let card3:UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.backImageOfCard
        return imageView
    }()
    
    let card4:UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.backImageOfCard
        return imageView
    }()
    
    let card5:UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.backImageOfCard
        return imageView
    }()
    
    let card6:UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.backImageOfCard
        return imageView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCardsBackSide() //cards
        
        
        self.view.backgroundColor = UIColor(patternImage: Image.backgroundPatternImage) //ViewBackground Pattern
    }
    
    //StatusBar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    //MARK: 카드 레이아웃 만들기
    func configureCardsBackSide() {

        //크기와 높이는 이미 정해져있다. 변수를 사용해서 쉽게 사용하도록 했다
        let width:CGFloat = 390 / 8 //약간의 공백을 주기 위해서 7이 아닌 8로 나누어 주었다. -> 48.5가 나오고 총 8개의 공백이 나오므로 6으로 공백값을 주자.
        let height:CGFloat = width * 1.27 //가로 세로 비율은 1: 1.27이므로 곱해준다.
        
        //공백값
        var inset = self.view.safeAreaLayoutGuide.leadingAnchor
        
        //각각 addSubView하기는 너무 힘들기 때문에 forEach문으로 한번에 한다.
        [card0,card1,card2,card3,card4,card5,card6].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: inset, constant: 6).isActive = true //왼쪽
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true //위쪽
            $0.widthAnchor.constraint(equalToConstant: width).isActive = true //너비
            $0.heightAnchor.constraint(equalToConstant: height).isActive = true //높이
            
            inset = $0.trailingAnchor //다음 카드의 inset은 전 카드의 trailingAnchor에 + 6이다.
        }
    
    }
}

